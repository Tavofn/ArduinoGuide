//
//  infoslide.swift
//  Arduino Pocket Guide
//
//  Created by Henry on 7/15/20.
//  Copyright © 2020 buildandteach.com. All rights reserved.
//

import SwiftUI
import UIKit
struct infoslide: View {
    @Binding var tutorialnum:Int
    @EnvironmentObject var manager:IAPManager
    @State var tutorialtouch = false
    @State private var schematicsheet:Bool = false
    var imagetop = ["ledimage","buttonimage","potentimage","sensorimage","servoimage","tempimage","lcdscreen"]
    var imageDef = ["leddef","buttondef","potentdef","ultradef","servodef","tempdef","LCDPINORDER"]
    var body: some View {
     
           
        ZStack
            {
                Color.black
                .edgesIgnoringSafeArea(.all)
            VStack
            {
                NavigationLink(destination: schemslide(tutorialnum: self.$tutorialnum), isActive: self.$tutorialtouch){
                               EmptyView()
                }.navigationBarTitle("Explanation")
                Image("")
                Image(imagetop[tutorialnum]).resizable().scaledToFit()
                if(self.tutorialnum == 6)
                {
                    Image(imageDef[tutorialnum]).resizable().scaledToFit().padding(.top, 100)
                    
                }else{
                    
                    Image(imageDef[tutorialnum]).resizable().scaledToFit()
                }
                
                }.navigationBarItems(trailing:
                    Button(action:{
                        self.tutorialtouch = true
                    }){
                        Text("Next")
                }) 

        }
     
    
}
   
}

