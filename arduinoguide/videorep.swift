//
//  videorep.swift
//  videoTesting
//
//  Created by Henry on 7/30/20.
//  Copyright © 2020 Tavo. All rights reserved.
//

import SwiftUI
import AVKit
struct videorep: UIViewControllerRepresentable {
    @State var urlpath:String
    @State var isVideo = false

    let controller = AVPlayerViewController()
    func makeUIViewController(context: UIViewControllerRepresentableContext<videorep>) -> AVPlayerViewController  {
        let url = Bundle.main.path(forResource: urlpath, ofType: "mp4")!
        let player1 = AVPlayer(url: URL(fileURLWithPath: url ))
        controller.player = player1
        player1.allowsExternalPlayback = false
        player1.play()
        return controller
            
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
        
    }
}
extension AVPlayerViewController
{
    open override func viewWillDisappear(_ animated: Bool) {
        self.player?.pause()
    }
  
}

