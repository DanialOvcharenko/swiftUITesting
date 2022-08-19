//
//  UserDefaults.swift
//  swiftUILessonX
//
//  Created by Mac on 23.02.2022.
//

import SwiftUI

struct UserDefaults1: View {
    
    @State var message = ""
    @State var get = ""
    
    var body: some View {
        NavigationView{
            VStack {
                
                Spacer()
                
                Text(get)
                
                TextField("Enter Your Message", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button (action: {
                    UserDefaults.standard.set(self.message, forKey: "Message")
                    self.get = self.message
                    self.message = ""
                }) {
                    Text("Save")
                        .padding()
                }
                .background(Color(.init(srgbRed: 0.2, green: 1, blue: 0.6, alpha: 0.9)))
                .foregroundColor(.black)
                .cornerRadius(10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Try to change color -->")
                        .foregroundColor(.blue)
                    Spacer()
                    Divider()
                    
                    NavigationLink(destination: UserDefaults2(), label: {
                        Text("UDColor")
                            .foregroundColor(.blue)
                    })
                        .padding(.trailing, 8)
    
                }
                .frame(width: 300, height: 60)
                .background(Color(.init(srgbRed: 0.9, green: 0.9, blue: 0.5, alpha: 0.9)))
                .foregroundColor(.black)
                .cornerRadius(16)
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 3)
                    )
                
                Spacer()
                   
            }
                
            }
            .onAppear{
                guard let gotMessage = UserDefaults.standard.value(forKey: "Message") else {
                    return
                }
                self.get = gotMessage as! String
            }
            
            .navigationBarTitle("UD", displayMode: .inline)
        }
    }


struct UserDefaults1_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaults1()
    }
}
