import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var documents: [Document]
    @State private var selectedDocument: Document?
    @State private var showingNewDocumentAlert = false
    @State private var newDocumentTitle = ""
    
    var body: some View {
        NavigationSplitView {
            DocumentListView(
                documents: documents,
                selectedDocument: $selectedDocument,
                onNewDocument: createNewDocument,
                onDeleteDocument: deleteDocument
            )
        } detail: {
            if let selectedDocument = selectedDocument {
                DocumentEditorView(document: selectedDocument)
            } else {
                Text("Select a document to edit")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .modelContainer(for: Document.self)
        .alert("New Document", isPresented: $showingNewDocumentAlert) {
            TextField("Document Title", text: $newDocumentTitle)
            Button("Create") {
                createDocument(title: newDocumentTitle)
                newDocumentTitle = ""
            }
            Button("Cancel", role: .cancel) {
                newDocumentTitle = ""
            }
        } message: {
            Text("Enter a title for your new document")
        }
    }
    
    private func createNewDocument() {
        showingNewDocumentAlert = true
    }
    
    private func createDocument(title: String) {
        let document = Document(title: title.isEmpty ? "Untitled Document" : title)
        modelContext.insert(document)
        selectedDocument = document
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving document: \(error)")
        }
    }
    
    private func deleteDocument(_ document: Document) {
        if selectedDocument == document {
            selectedDocument = nil
        }
        modelContext.delete(document)
        
        do {
            try modelContext.save()
        } catch {
            print("Error deleting document: \(error)")
        }
    }
}