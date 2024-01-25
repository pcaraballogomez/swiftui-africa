//
//  VideoListView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI

struct VideoListView: View {

    // MARK: - Properties
    @State var videos: [Video] = decode(.videos)
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(videos) { video in
                    NavigationLink(value: video) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    } //: NavigationLink
                } //: ForEach
            } //: List
            .listStyle(.insetGrouped)
            .navigationBarTitle("Video",
                                displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    } //: Button
                } //: TabbarItem
            } //: Toolbar
            .navigationDestination(for: Video.self) { video in
                VideoPlayerView(videoSelected: video.id,
                                videoTitle: video.name)
            }
        } //: NavigationSplitView
        detail: {
            VideoPlayerView(videoSelected: videos[0].id,
                            videoTitle: videos[0].name)
        }
    }
}

// MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
