//
//  TextViewDelegate.swift
//
//  Created by : Tomoaki Yagishita on 2021/12/28
//  © 2021  SmallDeskSoftware
//

import Foundation
import AppKit

class TextViewDelegate: NSObject {
    
}

extension TextViewDelegate: NSTextContentManagerDelegate {
//    func textContentManager(_ textContentManager: NSTextContentManager, textElementAt location: NSTextLocation) -> NSTextElement? {
//        print("NSTextContentManagerDelegate#textElementAt called with location: \(location)")
//        if let textContentStorage = textContentManager as? NSTextContentStorage,
//           let textStorage = textContentStorage.textStorage {
//            let startPos = textContentStorage.offset(from: textContentStorage.documentRange.location, to: location)
//            let next = textContentStorage.location(location, offsetBy: 1)
//            //let endPos = textContentStorage.offset(from: textContentStorage.documentRange.location, to: next)
//            let subNSRange = NSRange(location: startPos, length: 1)
//            //let subTextRange = NSTextRange(location: location, end: next)
//            let subRange = Range(subNSRange, in: textStorage.string)!
//
//            let startIndex = textStorage.string.index(textStorage.string.startIndex, offsetBy: startPos)
//            let endIndex = textStorage.string.index(textStorage.string.startIndex, offsetBy: startPos + 1)
//            let subString = textStorage.string[startIndex..<endIndex]
//            //let subRange = NSRange(location: location, length: 1)
//            return NSTextParagraph(attributedString: NSAttributedString(string: String(subString)))
//        }
////        if let textStorage = textContentManager.textStorage {
////            let paragraph = NSTextParagraph(attributedString: textStorage.attribu
////        return NSTextParagraph(textContentManager: textContentManager)
//        return nil
//    }
//    func textContentManager(_ textContentManager: NSTextContentManager, shouldEnumerate textElement: NSTextElement, options: NSTextContentManager.EnumerationOptions = []) -> Bool {
//        //print("NSTextContentManagerDelegate#shouldEnumerate called with textElement: \(textElement)")
//        return true
//    }
}

extension TextViewDelegate: NSTextContentStorageDelegate {
//    func textContentStorage(_ textContentStorage: NSTextContentStorage, textParagraphWith range: NSRange) -> NSTextParagraph? {
//        print("NSTextContentStorageDelegate#textContentStorage called with range: \(range)")
//        return nil
//    }
}

extension TextViewDelegate: NSTextStorageDelegate {
//    func textStorage(_ textStorage: NSTextStorage, willProcessEditing editedMask: NSTextStorageEditActions, range editedRange: NSRange, changeInLength delta: Int) {
//        print("NSTextStorageDelegate#willProcessEditing with range: \(editedRange) length: \(delta)")
//    }
//    func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorageEditActions, range editedRange: NSRange, changeInLength delta: Int) {
//        print("NSTextStorageDelegate#didProcessEditing with range: \(editedRange) length: \(delta)")
//    }
}

extension TextViewDelegate: NSTextLayoutManagerDelegate {
    
}
