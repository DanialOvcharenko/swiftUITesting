//
//  Firebase.swift
//  swiftUILessonX
//
//  Created by Mac on 14.02.2022.
//

import SwiftUI

struct Firebase: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack{
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                   Text("Username")
                    TextField("Enter username...", text: $username)
                    Divider()
                }
                .padding()
                
                VStack(alignment: .leading) {
                   Text("Password")
                    TextField("Enter password...", text: $password)
                    Divider()
                }
                .padding()
                
                Button("Press Me") {
                    print("Button pressed!")
                }
                .foregroundColor(.white)
                .padding(20)
                .background(.green)
                .clipShape(Capsule())
            }
            VStack{
                Text("(or)")
                HStack{
                    Text("Dont have an account ?")
                    Button("Sign UP") {
                        print("Button pressed!")
                    }
                    .padding(10)
                }
            }
        }
    }
}

struct Firebase_Previews: PreviewProvider {
    static var previews: some View {
        Firebase()
    }
}
