<<<<<<< copilot/fix-e8637daa-90fd-46a3-abd3-790dad2b61d7
# Document Editor

A SwiftUI-based document editor application with SwiftData for document management, created for GitHub Copilot Agent demonstration.

## Features

- **SwiftUI Interface**: Modern declarative UI built with SwiftUI
- **SwiftData Integration**: Persistent document storage using SwiftData
- **Document Management**: Create, edit, delete, and organize documents
- **Text Styling**: Basic text formatting including bold, italic, and font size adjustment
- **Split View Layout**: Document list sidebar with editor detail view
- **Word Count**: Real-time word counting
- **Auto-save**: Documents are automatically saved as you type

## Platform Requirements

This application requires **macOS 14.0 or later** as it uses SwiftUI and SwiftData, which are Apple platform-exclusive frameworks.

## Building and Running

To build and run this application on macOS:

```bash
swift run
```

Or open in Xcode:

```bash
open Package.swift
```

## Architecture

The application follows a clean SwiftUI architecture:

- **Models/Document.swift**: SwiftData model for document persistence
- **Views/ContentView.swift**: Main app view with navigation split view
- **Views/DocumentListView.swift**: Document list with CRUD operations  
- **Views/DocumentEditorView.swift**: Rich text editor with styling toolbar
- **main.swift**: App entry point and SwiftUI App configuration

## Usage

1. Launch the application
2. Click the "+" button to create a new document
3. Select a document from the sidebar to edit it
4. Use the styling toolbar to format text (bold, italic, font size)
5. Documents are automatically saved as you type
6. Delete documents by swiping left in the document list

---
*This project was created by GitHub Copilot Agent*
=======
# document-editor
This is a test of GitHub Copilot agent. All code in this project is made by github copilot

Prompt used:
Create a SwiftUI document editor in this repository. Use SwiftData for document management and a nice UI, include basic text styling.
>>>>>>> main
