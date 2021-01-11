//
//  videoslide.swift
//  Arduino Pocket Guide
//
//  Created by Henry on 7/28/20.
//  Copyright © 2020 buildandteach.com. All rights reserved.
//

import SwiftUI

struct videoslide: View {
    @State private var play: Bool = true
    @Binding var tutorialnum:Int
 
    var urls = ["LEDFINAL","buttonofficial","potentiometerofficial","ultrasonicofficial","servoofficial",
    "tempsensor","LCDOfficial"]
    var body: some View {
        ZStack
        {
            Color.black.edgesIgnoringSafeArea(.all)
            Image("blankCard").resizable().frame(height:400)
            VStack
            {
                videorep(urlpath: urls[tutorialnum]).frame(width:300,height:300)
            }
            }.navigationBarTitle("Video")
        
        
        
    }
}
