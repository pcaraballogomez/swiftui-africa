//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct InsetGalleryView: View {

    // MARK: - Properties
    let gallery: [String]

    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(gallery, id: \.self) { galleryItem in
                    Image(galleryItem)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                } //: ForEach
            } //: HStack
        } //: ScrollView
    }
}

// MARK: - Preview
struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = decode(.animals)

    static var previews: some View {
        InsetGalleryView(gallery: animals[0].gallery)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
