//
//  UserDefaults2.swift
//  swiftUILessonX
//
//  Created by Mac on 23.02.2022.
//

import SwiftUI

struct UserDefaults2: View {
    
    @State var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(self.isOn, forKey: "isOn")
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Toggle(isOn: self.$isOn) {
                Text("")
            }
            .fixedSize()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(isOn ? Color.green : Color.black)
    }
}


struct UserDefaults2_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaults2()
    }
}
