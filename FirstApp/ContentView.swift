//
//  ContentView.swift
//  FirstApp
//
//  Created by Sannan Hafeez on 24/03/20.
//  Copyright © 2020 Sannan Hafeez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show: Bool = false
    @State var viewState: CGSize = CGSize.zero
    @State var showCard: Bool = false
    @State var bottomState: CGSize = CGSize.zero
    @State var showFull: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(self.showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(Animation.default.delay(0.1))
            
            BackCardView()
                .frame(width: self.showCard ? 300 : 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .offset(y: self.showCard ? -180 : 0)
                .scaleEffect(self.showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(self.showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: self.showCard ? 0 : 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .offset(y: self.showCard ? -140 : 0)
                .scaleEffect(self.showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(self.showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: self.showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: self.showCard ? 375 : 340.0, height: 220.0)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: self.showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: self.viewState.width, y: self.viewState.height)
                .offset(y: self.showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }.onEnded { value in
                    self.viewState = .zero
                    self.show = false
                })
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: self.bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(DragGesture().onChanged { value in
                    self.bottomState = value.translation
                    self.bottomState.height += self.showFull ? -300 : 0
                    if self.bottomState.height < -300 {
                        self.bottomState.height = -300
                    }
                }.onEnded { value in
                    if (self.bottomState.height > 50) {
                        self.showCard = false
                    }
                    
                    if ((self.bottomState.height < -100 && !self.showFull) ||
                        (self.showFull && self.bottomState.height < -250)) {
                        self.bottomState.height = -300
                        self.showFull = true
                    } else {
                        self.bottomState = .zero
                        self.showFull = false
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.2)
            
            Text("This certificate is proof that Sannan Hafeez has achieved the UI Design course with absolute approval from himself!")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
