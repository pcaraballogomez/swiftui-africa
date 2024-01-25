//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct MapAnnotationView: View {

    // MARK: - Properties
    var location: NationParkLocation
    @State private var animation = 0.0

    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54,
                       height: 54,
                       alignment: .center)

            Circle()
                .stroke(Color.accentColor,
                        lineWidth: 2)
                .frame(width: 52,
                       height: 52,
                       alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,
                       height: 48,
                       alignment: .center)
                .clipShape(
                    Circle()
            )
        } //: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever()) {
                animation = 1
            }
        }
    }
}

// MARK: - Preview
struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [NationParkLocation] = decode(.locations)

    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
