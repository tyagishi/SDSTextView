//
//  SDSTextViewWithTextKit2.swift
//
//  Created by : Tomoaki Yagishita on 2021/12/23
//  © 2021  SmallDeskSoftware
//

import Foundation
import SwiftUI
import AppKit
import Combine

public class TextEditorControl: ObservableObject {
    @Published public var firstResponder: Bool = false
    @Published public var focusRange: NSRange? = nil
    public init() {}
}

public struct SDSTextView: NSViewRepresentable {
    @Binding var text: String
    @ObservedObject var control: TextEditorControl
    let rect: CGRect
    let textContentStorageDelegate: NSTextContentStorageDelegate?
    let textStorageDelegate: NSTextStorageDelegate?
    let textLayoutManagerDelegate: NSTextLayoutManagerDelegate?

    var textKit1Check: AnyCancellable? = nil
    
    public init(text: Binding<String>,
                control: TextEditorControl,
                rect: CGRect, textContentStorageDelegate: NSTextContentStorageDelegate? = nil,
                textStorageDelegate: NSTextStorageDelegate? = nil, textLayoutManagerDelegate: NSTextLayoutManagerDelegate? = nil ) {
        self._text = text
        self.control = control
        self.rect = rect
        self.textContentStorageDelegate = textContentStorageDelegate
        self.textStorageDelegate = textStorageDelegate
        self.textLayoutManagerDelegate = textLayoutManagerDelegate

        textKit1Check = NotificationCenter.default.publisher(for: NSTextView.didSwitchToNSLayoutManagerNotification)
            .sink { value in
                print("receive didSwitchToNSLayoutManagerNotification with \(value)")
            }

    }
    
    public func makeNSView(context: Context) -> NSTextView {
        //let textContentStorage = MyTextContentStorage()
        let textContentStorage =  NSTextContentStorage()
        textContentStorage.delegate = textContentStorageDelegate
        let textLayoutManager = NSTextLayoutManager()
        textContentStorage.addTextLayoutManager(textLayoutManager)
        textLayoutManager.delegate = textLayoutManagerDelegate
        
        let textContainer = NSTextContainer(size: rect.size)
        textLayoutManager.textContainer = textContainer
        let textView = NSTextView(frame: rect , textContainer: textContainer)
        textView.textStorage?.delegate = textStorageDelegate
        textContentStorage.textStorage?.setAttributedString(NSAttributedString(string: text))

        textView.delegate = context.coordinator
        textView.allowsUndo = true

        return textView
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    
    public func updateNSView(_ textView: NSTextView, context: Context) {
        if textView.string != text,
           let textStorage = textView.textStorage {
            print("text is updated in updateNSView")
            textStorage.setAttributedString(NSAttributedString(string: text))
        }
        DispatchQueue.main.async {
            if self.control.firstResponder == true {
                textView.window?.makeFirstResponder(textView)
                self.control.firstResponder = false
            }
            if let focusRange = self.control.focusRange {
                textView.scrollRangeToVisible(focusRange)
                self.control.focusRange = nil
            }
        }
    }
    
    public typealias NSViewType = NSTextView
    
    public class Coordinator: NSObject, NSTextViewDelegate {
        var parent: SDSTextView
        init(_ parent: SDSTextView) {
            self.parent = parent
        }
        
        public func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            self.parent.text = textView.string
        }
    }
}
