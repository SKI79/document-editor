import SwiftUI

struct DocumentEditorView: View {
    let document: Document
    @State private var content: String = ""
    @State private var title: String = ""
    @State private var isBold = false
    @State private var isItalic = false
    @State private var fontSize: Double = 14
    @FocusState private var isEditing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Title bar
            HStack {
                TextField("Document Title", text: $title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .textFieldStyle(.plain)
                    .onSubmit {
                        document.updateTitle(title)
                    }
                
                Spacer()
                
                Text("Words: \(wordCount)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
            
            // Styling toolbar
            StyleToolbar(
                isBold: $isBold,
                isItalic: $isItalic,
                fontSize: $fontSize
            )
            
            Divider()
            
            // Text editor
            TextEditor(text: $content)
                .font(.system(size: fontSize, weight: isBold ? .bold : .regular))
                .italic(isItalic)
                .padding()
                .focused($isEditing)
                .onChange(of: content) { _, newValue in
                    document.updateContent(newValue)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            title = document.title
            content = document.content
        }
        .navigationBarHidden(true)
    }
    
    private var wordCount: Int {
        let words = content.components(separatedBy: .whitespacesAndNewlines)
        return words.filter { !$0.isEmpty }.count
    }
}

struct StyleToolbar: View {
    @Binding var isBold: Bool
    @Binding var isItalic: Bool
    @Binding var fontSize: Double
    
    var body: some View {
        HStack {
            // Bold button
            Button(action: { isBold.toggle() }) {
                Image(systemName: "bold")
                    .foregroundColor(isBold ? .accentColor : .primary)
            }
            .buttonStyle(.plain)
            .help("Bold")
            
            // Italic button
            Button(action: { isItalic.toggle() }) {
                Image(systemName: "italic")
                    .foregroundColor(isItalic ? .accentColor : .primary)
            }
            .buttonStyle(.plain)
            .help("Italic")
            
            Divider()
                .frame(height: 20)
            
            // Font size controls
            HStack {
                Text("Size:")
                    .font(.caption)
                
                Slider(value: $fontSize, in: 10...24, step: 1) {
                    Text("Font Size")
                } minimumValueLabel: {
                    Text("A")
                        .font(.caption2)
                } maximumValueLabel: {
                    Text("A")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                .frame(width: 100)
                
                Text("\(Int(fontSize))")
                    .font(.caption)
                    .frame(width: 20)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(NSColor.windowBackgroundColor))
    }
}