//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 25/1/24.
//

import SwiftUI

struct MotionAnimationView: View {

    // MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    // MARK: - Functions
    func getRandomCoordinate(max: CGFloat) -> CGFloat {
        .random(in: 0...max)
    }

    func getRandomSize() -> CGFloat {
        .random(in: 10...300)
    }

    func getRandomScale() -> CGFloat {
        .random(in: 0.1...2.0)
    }

    func getRandomSpeed() -> Double {
        .random(in: 0.025...1.0)
    }

    func getRandomDelay() -> Double {
        .random(in: 0...2)
    }

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { circle in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(
                            width: getRandomSize(),
                            height: getRandomSize(),
                            alignment: .center
                        )
                        .scaleEffect(isAnimating ? getRandomScale() : 1)
                        .position(
                            x: getRandomCoordinate(max: geometry.size.width),
                            y: getRandomCoordinate(max: geometry.size.height)
                        )
                        .onAppear {
                            withAnimation(
                                .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .repeatForever()
                                    .speed(getRandomSpeed())
                                    .delay(getRandomDelay())
                            ) {
                                isAnimating = true
                            }
                        }
                } //: ForEach
            } //: ZStack
            .drawingGroup()
        } //: GeometryReader
    }
}

// MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
