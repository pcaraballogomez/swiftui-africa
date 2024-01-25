//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct ExternalWeblinkView: View {

    // MARK: - Properties
    let title: String
    let linkName: String
    let linkDestination: String

    // MARK: - Body
    var body: some View {
        if let url = URL(string: linkDestination) {
            GroupBox {
                HStack {
                    Image(systemName: "globe")
                    Text(title)

                    Spacer()

                    Link(destination: url) {
                        HStack {
                            Image(systemName: "arrow.up.right.square")
                            Text(linkName)
                        }
                    } //: Link
                    .foregroundColor(.accentColor)
                } //: HStack
            } //: GroupBox
        }
    }
}

// MARK: - Preview
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = decode(.animals)

    static var previews: some View {
        ExternalWeblinkView(title: "Wikipedia",
                            linkName: animals[0].name,
                            linkDestination: animals[0].link)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
