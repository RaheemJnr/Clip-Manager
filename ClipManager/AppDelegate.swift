//
//  ClipManagerApp.swift
//  ClipManager
//
//  Created by Raheem Jnr on 13/09/2024.
//

import SwiftUI
@main
struct ClipboardManagerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var clipboardManager = ClipboardManager()

    var body: some Scene {
        MenuBarExtra("Clipboard Manager", systemImage: "clipboard") {
            ContentView()
                .environmentObject(clipboardManager)
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .menuBarExtraStyle(.window)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide the dock icon
        NSApp.setActivationPolicy(.accessory)
    }
}
