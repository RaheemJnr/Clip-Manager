# Clipboard Manager for macOS

![Menu Bar Icon](screenshot/1023.png)

## Introduction
Clipboard Manager is a lightweight, efficient menu bar application for macOS that enhances your clipboard functionality. It allows you to store and manage multiple clipboard items, providing quick access to your copying history.

## Features
- **Menu Bar Integration**: Runs quietly in the background, accessible via a menu bar icon.
- **Clipboard History**: Keeps track of text and image clips, allowing you to access previously copied items.
- **Persistent Storage**: Saves your clipboard history between app restarts.
- **Image Support**: Handles both text and image clipboard content.
- **Quick Copy**: Easily copy any item from your history back to the clipboard with a single click.
- **Sleek UI**: Clean and intuitive SwiftUI interface.
- **No Dock Icon**: Operates solely from the menu bar for a clutter-free experience.

## Installation
1. Clone the repository:
   ```
   git clone https://github.com/RaheemJnr/Clip-Manager.git
   ```
2. Open the project in Xcode.
3. Build and run the application (Cmd + R).

## Usage
1. The app runs in the background and is accessible via the clipboard icon in the menu bar.
2. Click the icon to view your clipboard history.
3. Select any item to copy it back to your clipboard.
4. Use the "Quit" option in the menu to exit the application.

## Requirements
- macOS 11.0 or later
- Xcode 12.0 or later (for development)

## Technical Details
- Built with SwiftUI and AppKit
- Uses UserDefaults for persistent storage
- Implements NSPasteboard for clipboard interactions

## Potential Future Features
1. **Keyboard Shortcuts**: Quick access to clipboard history via customizable hotkeys.
2. **Search Functionality**: Ability to search through clipboard history.
3. **Categories/Tags**: Organize clipboard items into user-defined categories.
4. **Sync Across Devices**: iCloud sync to share clipboard history between multiple Macs.
5. **Rich Text Support**: Handle formatted text and maintain styling.
6. **Pinned Items**: Allow users to pin important items to the top of the list.
7. **Export/Import**: Functionality to export and import clipboard history.
8. **Launch at Login**: Option to start the app automatically on system boot.
9. **Snippet Expansion**: Expand short text codes into larger snippets.

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
[MIT License](LICENSE)

## Support
If you encounter any problems or have any suggestions, please open an issue on the GitHub repository.

---

Happy copying and pasting!
