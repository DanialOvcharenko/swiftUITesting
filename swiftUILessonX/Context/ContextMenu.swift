//
//  ContextMenu.swift
//  swiftUILessonX
//
//  Created by Mac on 13.02.2022.
//

import SwiftUI

struct ContextMenu: View {
    
    @State private var rotation: Double = 0.0
    @State private var showingWelcome = false
    
    var body: some View {
        VStack {
            Image("ukraine")
                .resizable()
                .frame(height: 300)
                .cornerRadius(30)
                .padding()
                .contextMenu {
                    VStack{
                        Button(action: {
                            print("Copy")
                        }) {
                            HStack{
                                Image(systemName: "doc.on.doc")
                                Text("Copy")
                            }
                        }
                        
                        Button(action: {
                            print("Share")
                        }) {
                            HStack{
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                        }
                    }
            }
            
            Spacer()
                .frame(height: 20)
            
            VStack{
                Toggle(isOn: $showingWelcome.animation(.spring())) {
                    Text("Нажми справа")
                }
                if showingWelcome {
                    Text("Нажми на кубик")
                        .fontWeight(.black)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            Spacer()
                .frame(height: 50)
            
            Rectangle()
                .fill(Color.yellow)
                .border(Color.blue, width: 5)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeInOut(duration:3).delay(1))
                .onTapGesture {
                    self.rotation += 360
                }
            
                
            
            Spacer()
               
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
