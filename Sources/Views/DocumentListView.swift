import SwiftUI

struct DocumentListView: View {
    let documents: [Document]
    @Binding var selectedDocument: Document?
    let onNewDocument: () -> Void
    let onDeleteDocument: (Document) -> Void
    
    var body: some View {
        List(selection: $selectedDocument) {
            ForEach(documents) { document in
                VStack(alignment: .leading, spacing: 4) {
                    Text(document.title)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(document.content.isEmpty ? "Empty document" : String(document.content.prefix(100)))
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    
                    Text("Updated \(document.updatedAt, style: .relative)")
                        .font(.caption2)
                        .foregroundColor(.tertiary)
                }
                .padding(.vertical, 2)
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedDocument = document
                }
            }
            .onDelete(perform: deleteDocuments)
        }
        .navigationTitle("Documents")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: onNewDocument) {
                    Label("New Document", systemImage: "plus")
                }
            }
        }
    }
    
    private func deleteDocuments(offsets: IndexSet) {
        for index in offsets {
            onDeleteDocument(documents[index])
        }
    }
}