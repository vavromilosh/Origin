//
//  ContentView.swift
//  Origin
//
//  Created by Milosh on 14/09/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var markdownText: String = "# Hello\n\nThis is **bold** and this is *italic*."

    var body: some View {
        HStack(spacing: 0) {
            TextEditor(text: $markdownText)
                .font(.system(.body, design: .monospaced))
                .padding()
                .frame(minWidth: 300)

            Divider()

            ScrollView {
                renderMarkdown(markdownText)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(minWidth: 300)
        }
        .frame(minWidth: 600, minHeight: 400)
    }

    func renderMarkdown(_ text: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(text.split(separator: "\n", omittingEmptySubsequences: false).map(String.init), id: \.self) { line in
                if line.hasPrefix("# ") {
                    Text(line.dropFirst(2))
                        .font(.title)
                } else if line.hasPrefix("- ") {
                    Text("•  " + line.dropFirst(2))
                } else {
                    Text(.init(line))
                }
            }
        }
    }
}
