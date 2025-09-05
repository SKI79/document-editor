import Foundation
import SwiftData

@Model
class Document {
    var title: String
    var content: String
    var createdAt: Date
    var updatedAt: Date
    
    init(title: String = "Untitled Document", content: String = "") {
        self.title = title
        self.content = content
        self.createdAt = Date()
        self.updatedAt = Date()
    }
    
    func updateContent(_ newContent: String) {
        self.content = newContent
        self.updatedAt = Date()
    }
    
    func updateTitle(_ newTitle: String) {
        self.title = newTitle
        self.updatedAt = Date()
    }
}