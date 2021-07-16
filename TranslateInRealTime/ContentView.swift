//
//  ContentView.swift
//  TranslateInRealTime
//
//  Created by Tyrant on 2021/7/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("打开字幕", action: {
            TranslatedWordsDisplayController.signleton.open()
        })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct TranslatedWordsDisplayView: View {
        
    var body: some View {
        Button("关闭", action: {
            TranslatedWordsDisplayController.signleton.dismiss()
        })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}


class TranslatedWordsDisplayController: NSWindowController {
    
    static let signleton = TranslatedWordsDisplayController()
    
    
    init() {
        
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 800, height: 150),
            styleMask: [.fullSizeContentView, .titled],
            backing: .buffered, defer: false)
        
        window.center()
        window.alphaValue = 0.7
        window.level = .floating
        window.isMovableByWindowBackground = true
        
        window.titlebarAppearsTransparent = true
        window.isReleasedWhenClosed = true
        super.init(window: window)
    }
    
    func open() {
        self.window?.contentView = NSHostingView(rootView: TranslatedWordsDisplayView())
        self.showWindow(nil);
    }
    
    func dismiss() {
        self.window?.close()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func windowDidLoad() {
        print("fasdfdsafsa")
    }
    
    
}
