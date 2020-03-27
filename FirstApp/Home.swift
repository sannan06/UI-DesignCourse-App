//
//  Home.swift
//  FirstApp
//
//  Created by Sannan Hafeez on 27/03/20.
//  Copyright © 2020 Sannan Hafeez. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile: Bool = false
    @State var viewState: CGSize = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile: self.$showProfile)
                .padding(.top, 44)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: self.showProfile ? -450 + self.viewState.height/5: 0)
                .rotation3DEffect(Angle(degrees: self.showProfile ? Double(self.viewState.height/10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(self.showProfile ? 0.9 : 1)
                .onTapGesture {
                    if (self.showProfile) {self.showProfile.toggle()}
                }
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
                        
            MenuView()
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: self.viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        if self.viewState.height < -80 {
                            self.viewState.height = -80
                        }
                    }.onEnded { value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                    }
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: {self.showProfile.toggle()}) {
            Image("sannan")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 50)
                .padding(.top, 10)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
