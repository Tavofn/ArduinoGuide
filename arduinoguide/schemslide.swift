//
//  schemslide.swift
//  Arduino Pocket Guide
//
//  Created by Henry on 7/15/20.
//  Copyright © 2020 buildandteach.com. All rights reserved.
//

import SwiftUI

struct schemslide: View {
    @Binding var tutorialnum:Int
    @State var tutorialtouch = false
    @State private var codesheet = false
    @EnvironmentObject var manager:IAPManager
    var schemimage = ["ledschem","buttonschem","potentschem","sensorschem","servoschem","tempschem","lcdschem"]
    var body: some View {
      ZStack
        {
        Color.black
        .edgesIgnoringSafeArea(.all)
            VStack
            {
                NavigationLink(destination: codeslide(tutorialnum: self.$tutorialnum), isActive: self.$tutorialtouch){
                    EmptyView()
                }.navigationBarTitle("Schematic")
                
                Image(schemimage[tutorialnum]).resizable().scaledToFit()
                
            }.navigationBarItems(trailing:
                Button(action:{
                    self.tutorialtouch = true
                }){
                Text("Next")
            })
        }
    }
}


