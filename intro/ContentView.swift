//
//  ContentView.swift
//  intro
//
//  Created by JiaChen(: on 22/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nameRotation = Angle(degrees: 30)
    @State private var rabbitTextRotation = Angle(degrees: 10)
    @State private var rabbitImageScale: CGFloat = 1
    
    @State private var videoButtonRotation = Angle(degrees: 15)
    @State private var gitHubButtonRotation = Angle(degrees: -10)
    @State private var instagramButtonRotation = Angle(degrees: 0)
    
    @State private var helloOffset: CGFloat = -50
    
    @State private var phase: CGFloat = 0
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack {
            Color
                .yellow
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("HELLO IM")
                    .font(.system(size: 30, weight: .semibold, design: .serif))
                    .italic()
                    .offset(x: 0, y: helloOffset)
                    .foregroundColor(.red)
                
                Text("jia chen")
                    .padding()
                    .font(.system(size: 50, weight: .heavy, design: .serif))
                    .rotation3DEffect(
                        nameRotation,
                        axis: (x: 2, y: 1, z: 0)
                    )
                
                HStack(alignment: .top, spacing: 0) {
                    Image("rabbit")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .mask(Circle())
                        .scaleEffect(rabbitImageScale)
                        .frame(width: 70, height: 70)
                        .offset(x: 35, y: -35)
                        .zIndex(1.0)
                    
                    ZStack {
                        Color.orange
                        VStack(alignment: .leading) {
                            Text("Hey look my rabbit!!!")
                                .font(.system(size: 20, weight: .medium, design: .serif))
                            
                            Text("Clearly better than pommycat")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .italic()
                        }
                        .padding(.leading)
                    }
                    .overlay(
                        Rectangle()
                            .stroke(style: StrokeStyle(lineWidth: 4,
                                                       lineCap: .round,
                                                       dash: [0, 15],
                                                       dashPhase: phase))
                    )
                    .frame(width: 200, height: 150)
                    .rotation3DEffect(
                        rabbitTextRotation,
                        axis: (x: 1, y: 0.5, z: 0)
                    )
                }
                .padding(.top, 35)
                
                Button(action: {
                    openURL(URL(string: "https://youtube.com/watch?v=dQw4w9WgXcQ")!)
                }, label: {
                    HStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Text("watch videoooo")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .background(Color.green.shadow(color: .green, radius: 3, x: 0.5, y: 1))
                })
                .rotationEffect(videoButtonRotation)
                .padding(.top)
                
                Button(action: {
                    openURL(URL(string: "https://github.com/jiachenyee")!)
                }, label: {
                    HStack {
                        Image(systemName: "curlybraces")
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Text("github")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.black.shadow(color: .black, radius: 3, x: 0.5, y: 1))
                })
                .rotationEffect(gitHubButtonRotation)
                .offset(x: 55, y: 0)
                
                Button(action: {
                    openURL(URL(string: "https://instagram.com/jiachenyee")!)
                }, label: {
                    HStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.white)
                            .opacity(0.8)
                        Text("instagramm")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.yellow, .red, .purple]),
                                               startPoint: .bottomLeading,
                                               endPoint: .topTrailing)
                                    .shadow(color: .purple, radius: 3, x: 0.5, y: 1))
                })
                .rotationEffect(instagramButtonRotation)
                .offset(x: -50, y: 0)
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                nameRotation = Angle(degrees: -30)
            }
            
            withAnimation(.easeInOut.repeatForever()) {
                rabbitTextRotation = Angle(degrees: 0)
            }
            
            withAnimation(.linear(duration: 0.5).repeatForever()) {
                rabbitImageScale = 1.3
                helloOffset = 0
            }
            
            withAnimation(.easeInOut(duration: 0.5).repeatForever()) {
                videoButtonRotation = Angle(degrees: 0)
                gitHubButtonRotation = Angle(degrees: 5)
                instagramButtonRotation = Angle(degrees: -15)
            }
            
            withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: false)) {
                phase -= 30
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
