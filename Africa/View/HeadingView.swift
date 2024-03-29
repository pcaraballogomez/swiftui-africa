//
//  HeadingView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct HeadingView: View {

    // MARK: - Properties
    let headingSystemImage: String
    let headingText: String

    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headingSystemImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        } //: HStack
        .padding(.vertical)
    }
}

// MARK: - Preview
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingSystemImage: "photo.on.rectangle.angled",
                    headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
