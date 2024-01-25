//
//  InsetFactsView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct InsetFactsView: View {

    // MARK: - Properties
    let facts: [String]

    // MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(facts, id: \.self) { fact in
                    Text(fact)
                }
            } //: TabView
            .tabViewStyle(.page)
            .frame(minHeight: 148,
                   idealHeight: 168,
                   maxHeight: 180)
        } //: GroupBox
    }
}


// MARK: - Preview
struct InsetFactsView_Previews: PreviewProvider {
    static let animals: [Animal] = decode(.animals)

    static var previews: some View {
        InsetFactsView(facts: animals[0].facts)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
