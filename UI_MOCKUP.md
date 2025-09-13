# Document Editor - UI Layout

## Application Architecture

```
DocumentEditorApp (main.swift)
└── ContentView
    ├── NavigationSplitView
    │   ├── Sidebar: DocumentListView
    │   │   ├── Document List
    │   │   ├── New Document Button (+)
    │   │   └── Delete functionality
    │   └── Detail: DocumentEditorView
    │       ├── Title TextField
    │       ├── StyleToolbar (Bold, Italic, Font Size)
    │       └── TextEditor with styling
    └── SwiftData Model Container
```

## UI Mockup (when running on macOS)

```
┌─────────────────────────────────────────────────────────────────────┐
│ Document Editor                                                  ○ ○ ○│
├─────────────────┬───────────────────────────────────────────────────┤
│ Documents     + │ My Important Notes              Words: 156        │
├─────────────────┼───────────────────────────────────────────────────┤
│ • My Important  │ [B] [I] Size: ═══════◦══ 14                      │
│   Notes         ├───────────────────────────────────────────────────┤
│   Lorem ipsum...│                                                   │
│   2 hours ago   │ This is my document content. I can type here     │
│                 │ and it will be automatically saved to SwiftData. │
│ • Meeting Notes │                                                   │
│   Action items  │ The text styling toolbar above allows me to:     │
│   1 day ago     │ - Make text **bold** or *italic*                 │
│                 │ - Adjust font size with the slider               │
│ • Project Ideas │ - See live word count                            │
│   Brainstorming │                                                   │
│   3 days ago    │ Documents are listed in the sidebar and can be   │
│                 │ created with the + button or deleted by swiping. │
│                 │                                                   │
└─────────────────┴───────────────────────────────────────────────────┘
```

## Features Implemented

✅ SwiftUI-based user interface
✅ SwiftData for document persistence  
✅ Navigation split view layout
✅ Document CRUD operations (Create, Read, Update, Delete)
✅ Rich text editor with TextEditor
✅ Basic text styling (Bold, Italic, Font Size)
✅ Real-time word counting
✅ Auto-save functionality
✅ Document metadata (created/updated timestamps)
✅ Clean, modern UI with proper styling

## Data Model

- **Document**: SwiftData model with title, content, timestamps
- **Persistence**: Automatic SwiftData container setup
- **Relationships**: Simple document collection storage

## Platform Notes

This application requires macOS 14+ to build and run due to SwiftUI and SwiftData dependencies.