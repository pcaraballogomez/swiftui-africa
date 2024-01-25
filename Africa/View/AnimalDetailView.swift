//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct AnimalDetailView: View {

    // MARK: - Properties
    let animal: Animal

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {

                // Hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )

                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)

                // Gallery
                Group {
                    HeadingView(headingSystemImage: "photo.on.rectangle.angled",
                                headingText: "Wilderness in Pictures")
                    InsetGalleryView(gallery: animal.gallery)
                } //: Group - Headline
                .padding(.horizontal)

                // Facts
                Group {
                    HeadingView(headingSystemImage: "questionmark.circle",
                                headingText: "Did you know")
                    InsetFactsView(facts: animal.facts)
                } //: Group - Facts
                .padding(.horizontal)

                // Description
                Group {
                    HeadingView(headingSystemImage: "info.circle",
                                headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                } //: Group - Description
                .padding(.horizontal)

                // Map
                Group {
                    HeadingView(headingSystemImage: "map",
                                headingText: "National Parks")
                    InsetMapView()
                } //: Group - Map
                .padding(.horizontal)

                // Link
                Group {
                    HeadingView(headingSystemImage: "books.vertical",
                                headingText: "Learn more")
                    ExternalWeblinkView(title: "Wikipedia",
                                        linkName: animal.name,
                                        linkDestination: animal.link)
                } //: Group - Link
                .padding(.horizontal)

            } //: VStack
            .navigationBarTitle("Learn about \(animal.name)",
                                displayMode: .inline)
        } //: ScrollView
    }
}

// MARK: - Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = decode(.animals)

    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
