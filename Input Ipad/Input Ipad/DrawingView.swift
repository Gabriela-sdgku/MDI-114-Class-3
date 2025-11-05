//
//  DrawingView.swift
//  Input Ipad
//
//  Created by Gaby Sanchez on 10/15/25.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @State private var canvasView = PKCanvasView()
    @State private var toolPicker = PKToolPicker()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                CanvasView(canvasView: $canvasView, toolPicker: $toolPicker)
                    .navigationBarTitle("Drawing Pad", displayMode: .inline)
                    .navigationBarItems(
                        leading: HStack {
                            Button(action: clearCanvas) {
                                Label("Clear", systemImage: "trash")
                            }
                            .keyboardShortcut("k", modifiers: .command)
                        },
                        trailing: HStack(spacing: 20) {
                            Button(action: undo) {
                                Label("Undo", systemImage: "arrow.uturn.backward")
                            }
                            .keyboardShortcut("z", modifiers: .command) // ⌘Z
                            
                            Button(action: redo) {
                                Label("Redo", systemImage: "arrow.uturn.forward")
                            }
                            .keyboardShortcut("z", modifiers: [.command, .shift]) // ⇧⌘Z
                        }
                    )
                    .onAppear(perform: setupToolPicker)
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    private func setupToolPicker() {
        // TODO 1: Toolpicker
    }
    
    private func clearCanvas() {
        // TODO 2:
    }

    private func undo() {
        // TODO 3:
    }

    private func redo() {
        // TODO 4:
        
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    @Binding var toolPicker: PKToolPicker

    func makeUIView(context: Context) -> PKCanvasView {
        // TODO 5: Drawing policy
        
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: CanvasView

        init(_ parent: CanvasView) {
            self.parent = parent
        }

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            // TODO 6: Action
        }
    }
}

// MARK: - SwiftUI Preview
struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
