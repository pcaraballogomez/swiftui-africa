//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {

    // MARK: - Properties
    var videoSelected: String
    var videoTitle: String

    // MARK: - Body
    var body: some View {
        if let player = getVideoPlayer(fileName: videoSelected,
                                       fileFormat: .mp4) {
            VStack {
                VideoPlayer(player: player) {
//                    Text(videoTitle)
                } //: VideoPlayer
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
            } //: VStack
            .accentColor(.accentColor)
            .onAppear {
                guard UIDevice.current.userInterfaceIdiom == .phone else { return }
                player.play()
            }
            .navigationBarTitle(videoTitle,
                                displayMode: .inline)
        } //: Player unwrap
    }
}

// MARK: - Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion",
                            videoTitle: "Lion")
        } //: NavigationView
    }
}
