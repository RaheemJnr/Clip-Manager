import SwiftUI

struct ContentView: View {
    @EnvironmentObject var clipboardManager: ClipboardManager
    @State private var copiedItemId: UUID?
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(clipboardManager.clipboardItems) { item in
                        ClipboardItemView(item: item) {
                            clipboardManager.copyToClipboard(item: item)
                            copiedItemId = item.id
                        }
                        .overlay(
                            Group {
                                if copiedItemId == item.id {
                                    Text("Copied!")
                                        .padding(4)
                                        .background(Color.green.opacity(0.8))
                                        .cornerRadius(4)
                                        .transition(.opacity)
                                        .animation(.easeInOut(duration: 0.5), value: copiedItemId)
                                        .onAppear {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                copiedItemId = nil
                                            }
                                        }
                                }
                            }
                        )
                    }
                }
                .padding()
            }
        }
        .frame(width: 300, height: 400)
    }
}

struct ClipboardItemView: View {
    let item: ClipboardItem
    let onCopy: () -> Void
    
    var body: some View {
        HStack {
            if let text = item.text {
                Text(text)
                    .lineLimit(2)
            } else if let imageData = item.imageData, let nsImage = NSImage(data: imageData) {
                Image(nsImage: nsImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Button(action: onCopy) {
                    Image(systemName: "doc.on.doc")
                }
                .buttonStyle(BorderlessButtonStyle())
                Text(item.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
