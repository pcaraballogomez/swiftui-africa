//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

enum VideoFormat: String {
    case mp4
}

func getVideoPlayer(fileName: String, fileFormat: VideoFormat) -> AVPlayer? {
    guard let url = Bundle.main.url(forResource: fileName,
                                    withExtension: fileFormat.rawValue) else {
        return nil
    }
    videoPlayer = AVPlayer(url: url)
    return videoPlayer
}
