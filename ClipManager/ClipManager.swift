import SwiftUI
import AppKit
import UniformTypeIdentifiers

import SwiftUI
import AppKit
import UniformTypeIdentifiers

class ClipboardManager: ObservableObject {
    @Published var clipboardItems: [ClipboardItem] = []
    private var timer: Timer?
    private let maxItems = 50
    
    init() {
        loadItems()
        startMonitoring()
    }
    
    
    func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.checkClipboard()
        }
    }
    
    private func checkClipboard() {
        let pasteboard = NSPasteboard.general
        
        if let urls = pasteboard.readObjects(forClasses: [NSURL.self], options: nil) as? [URL], !urls.isEmpty {
            //print("File URLs found: \(urls)")
            for url in urls {
                if let image = NSImage(contentsOf: url) {
                    
                    if let tiffData = image.tiffRepresentation,
                       let bitmapImage = NSBitmapImageRep(data: tiffData),
                       let pngData = bitmapImage.representation(using: .png, properties: [:]) {
                        addNewItem(ClipboardItem(text: nil, imageData: pngData, timestamp: Date()))
                        saveItems()
                    }
                    break
                }
            }
        } else if let image = NSImage(pasteboard: pasteboard) {
            
            if let tiffData = image.tiffRepresentation,
               let bitmapImage = NSBitmapImageRep(data: tiffData),
               let pngData = bitmapImage.representation(using: .png, properties: [:]) {
                addNewItem(ClipboardItem(text: nil, imageData: pngData, timestamp: Date()))
                saveItems()
            }
        } else if let string = pasteboard.string(forType: .string) {
            
            addNewItem(ClipboardItem(text: string, imageData: nil, timestamp: Date()))
            saveItems()
        } else {
            print("No recognizable data found on clipboard")
        }
    }
    
    
    private func addNewItem(_ newItem: ClipboardItem) {
        DispatchQueue.main.async {
            // Check if the new item already exists in the array
            if !self.clipboardItems.contains(where: { $0.isEqual(to: newItem) }) {
                self.clipboardItems.insert(newItem, at: 0)
                if self.clipboardItems.count > 50 {
                    self.clipboardItems.removeLast()
                }
                self.saveItems()
            }
        }
    }
    
    
    func copyToClipboard(item: ClipboardItem) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        
        if let text = item.text {
            pasteboard.setString(text, forType: .string)
        } else if let imageData = item.imageData, let image = NSImage(data: imageData) {
            pasteboard.writeObjects([image])
        }
    }
    
    //save and load to mini storage
    private func saveItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(clipboardItems) {
            UserDefaults.standard.set(encoded, forKey: "SavedClipboardItems")
        }
    }
    
    private func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "SavedClipboardItems") {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([ClipboardItem].self, from: savedItems) {
                clipboardItems = loadedItems
            }
        }
    }
}

