//
//  SDSTextViewWithTextKit2.swift
//
//  Created by : Tomoaki Yagishita on 2021/12/23
//  © 2021  SmallDeskSoftware
//

import Foundation
import SwiftUI
import AppKit

public struct SDSTextView: NSViewRepresentable {
    @Binding var text: String
    let rect: CGRect
    let textContentStorageDelegate: NSTextContentStorageDelegate?
    let textStorageDelegate: NSTextStorageDelegate?
    let textLayoutManagerDelegate: NSTextLayoutManagerDelegate?

    
    public init(text: Binding<String>, rect: CGRect, textContentStorageDelegate: NSTextContentStorageDelegate? = nil,
                textStorageDelegate: NSTextStorageDelegate? = nil, textLayoutManagerDelegate: NSTextLayoutManagerDelegate? = nil ) {
        self._text = text
        self.rect = rect
        self.textContentStorageDelegate = textContentStorageDelegate
        self.textStorageDelegate = textStorageDelegate
        self.textLayoutManagerDelegate = textLayoutManagerDelegate
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
        textView.string = text

        return textView
    }
    
    public func updateNSView(_ textView: NSTextView, context: Context) {
        print("updateNSView called")
        textView.string = text
    }
    
    public typealias NSViewType = NSTextView
    
    
}
