//
//  CoverImageView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct CoverImageView: View {

    // MARK: - Properties
    let coverImages: [CoverImage] = decode(.covers)

    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { img in
                Image(img.name)
                    .resizable()
                    .scaledToFill()
            } //: ForEach
        } //: TabView
        .tabViewStyle(.page)
    }
}

// MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400,
                                  height: 300))
    }
}
