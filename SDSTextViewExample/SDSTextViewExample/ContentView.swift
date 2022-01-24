//
//  ContentView.swift
//
//  Created by : Tomoaki Yagishita on 2021/12/28
//  © 2021  SmallDeskSoftware
//

import SwiftUI
import SDSTextView

struct ContentView: View {
    @State private var text = """
Hello
world
"""
    let delegate = TextViewDelegate()
    @State private var control = TextEditorControl()

    var body: some View {
        VStack {
            Text("SDSTextEditorExample")
                .font(.title).lineLimit(1)
//            GeometryReader { geom in
//                SDSTextView(text: $text,
//                            control: control,
//                            rect: geom.frame(in: .local),
//                            textContentStorageDelegate: delegate,
//                            textStorageDelegate: delegate,
//                            textLayoutManagerDelegate: delegate)
//            }
            SDSPushOutTextView(text: $text, control: control,
                               textContentStorageDelegate: delegate,
                               textStorageDelegate: delegate,
                               textLayoutManagerDelegate: delegate)
        }
        .frame(width: 800, height: 500)
            .padding()
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


