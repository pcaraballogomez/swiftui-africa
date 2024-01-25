//
//  ContentView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties
    let animals: [Animal] = decode(.animals)
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()),
              count: gridColum)
    }
    @State private var isGridViewActive = false
    @State private var gridColum = 2
    @State private var toolbarIcon = "square.grid.2x2"

    // MARK: - Functions
    private func switchGridLayout() {
        gridColum = gridLayout.count % 3 + 1
        updateToolbarIcon()
    }

    private func updateToolbarIcon() {
        switch gridColum {
        case 1:
            toolbarIcon = "rectangle.grid.1x2"
        case 2:
            toolbarIcon = "square.grid.2x2"
        case 3:
            toolbarIcon = "square.grid.3x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            Group {
                if !isGridViewActive {
                    // MARK: - List
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: .zero,
                                                      leading: .zero,
                                                      bottom: .zero,
                                                      trailing: .zero))

                        ForEach(animals) { animal in
                            NavigationLink(value: animal) {
                                AnimalListItemView(animal: animal)
                            } //: NavigationLink
                        } //: ForEach

                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    // MARK: - Grid
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(value: animal) {
                                    AnimalGridItemView(animal: animal)
                                } //: NavigationLink
                            } //: ForEach
                        } //: LazyVGrid
                        .padding(10)
                        .animation(.easeIn, value: gridColum)
                    } //: ScrollView grid
                } //: List/Grid condition
            } //: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {

                        // List button
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }

                        // Grid button
                        Button {
                            if isGridViewActive {
                                switchGridLayout()
                            }
                            isGridViewActive = true
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    } //: HStack
                } //: ToolbarItem
            } //: Toolbar
            .navigationDestination(for: Animal.self) { animal in
                AnimalDetailView(animal: animal)
            }
        } //: NavigationSplitView
        detail: {
            AnimalDetailView(animal: animals[0])
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
