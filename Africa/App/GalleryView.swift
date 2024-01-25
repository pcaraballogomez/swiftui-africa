//
//  GalleryView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct GalleryView: View {

    // MARK: - Properties

    // Simple grid definition
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]

    // Efficient grid definition
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // Dynamic grid layout
    @State private var selectedAnimal: String = "lion"
    @State private var gridColumn = 3.0

    let animals: [Animal] = decode(.animals)
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()),
              count: Int(gridColumn))
    }

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {

                // MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 640)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 8)
                    }

                // MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1.0)
                    .padding(.horizontal)

                // MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 1)
                            }
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    } //: ForEach
                } //: VStack
                .padding(.horizontal, 10)
                .padding(.vertical, 15)
                .animation(.easeIn, value: gridColumn)
            } //: LazyVGrid
        } //: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
