//
//  codeslide.swift
//  Arduino Pocket Guide
//
//  Created by Henry on 7/15/20.
//  Copyright © 2020 buildandteach.com. All rights reserved.
//

import SwiftUI

struct codeslide: View {
    @Binding var tutorialnum:Int
    @EnvironmentObject var manager:IAPManager
    @State var scale:CGFloat = 1
    @State var tutorialtouch = false
    @State var showAlert = false
    @State private var codeimage = ["ledcode","buttoncode","potentcode","ultracode","servocode","tempcode","lcdcode"]
    var body: some View {
        ZStack
        {
            
            Color.black
            .edgesIgnoringSafeArea(.all)
            VStack
            {
                NavigationLink(destination: videoslide(tutorialnum: self.$tutorialnum), isActive: self.$tutorialtouch){
                                   EmptyView()
                               }.navigationBarTitle("Code")
                Image(codeimage[self.tutorialnum]).resizable().scaledToFit()
            }.navigationBarItems(trailing:
                Button(action:{
          
                    if(UserDefaults.standard.bool(forKey: "contentunlocked") || (self.tutorialnum == 0 || self.tutorialnum == 1 || self.tutorialnum == 2))
                        {
                            self.tutorialtouch = true
                        }else if(!UserDefaults.standard.bool(forKey: "contentunlocked") && (self.tutorialnum == 3||self.tutorialnum == 4||self.tutorialnum == 5)){
                            
                            self.showAlert = true
                        }
                    
                }){
                Text("Next")
            }).alert(isPresented: $showAlert) {
                
                Alert(title: Text("These Videos are Locked"), message: Text("To access all the videos and the LCD tutorial in the app, please purchase them here for $0.99."), primaryButton: .cancel(), secondaryButton: .default(Text("Buy"), action: {
                    self.manager.purchase(product:"com.tavo.videoslcd")
            }))
            }
            
        }
    }
}

