//
//  ContentView.swift
//  swiftUILessonX
//
//  Created by Mac on 12.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedView = 2
    
    var body: some View {
        TabView (selection: $selectedView) {
            BuyList()
                .tabItem {
                Image(systemName: "square.and.pencil")
                Text("расходы")
            } .tag(1)
            MapKit()
                .tabItem {
                Image(systemName: "map")
                Text("карта")
            } .tag(2)
            ContextMenu()
                .tabItem {
                    Image(systemName: "contextualmenu.and.cursorarrow")
                    Text("контекст")
            } .tag(3)
            UserDefaults1()
                .tabItem {
                    Image(systemName: "tablecells")
                    Text("Defaults")
            } .tag(4)
            APIJSON()
                .tabItem {
                    Image(systemName: "archivebox")
                    Text("JSON")
            } .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
