//
//  Clipboarditem.swift
//  ClipManager
//
//  Created by Raheem Jnr on 13/09/2024.
//

import Foundation
import AppKit

struct ClipboardItem: Identifiable, Codable {
    let id: UUID
    let text: String?
    let imageData: Data?
    let timestamp: Date
    
    func isEqual(to other: ClipboardItem) -> Bool {
        if let text = text, let otherText = other.text {
            return text == otherText
        } else if let imageData = imageData, let otherImageData = other.imageData {
            return imageData == otherImageData
        }
        return false
    }
    
    enum CodingKeys: String, CodingKey {
        case id, text, imageData, timestamp
    }
    
    init(text: String?, imageData: Data?, timestamp: Date) {
        self.id = UUID()
        self.text = text
        self.imageData = imageData
        self.timestamp = timestamp
    }
}
