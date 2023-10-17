//
//  TabBar.swift
//  DublinGate
//
//  Created by Horacio Mota on 17/10/2023.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 0
       
       var body: some View {
           TabView(selection: $selectedTab) {
               HomeView()
                   .tabItem {
                       Image(systemName: "house.fill")
                       Text("Home")
                   }
                   .tag(0)
               
               HomeView()
                   .tabItem {
                       Image(systemName: "magnifyingglass")
                       Text("Search")
                   }
                   .tag(1)
               
               HomeView()
                   .tabItem {
                       Image(systemName: "heart.fill")
                       Text("Favorites")
                   }
                   .tag(2)
               
               HomeView()
                   .tabItem {
                       Image(systemName: "person.fill")
                       Text("Profile")
                   }
                   .tag(3)
           }
       }
   }


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
