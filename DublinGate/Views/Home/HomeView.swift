//
//  ContentView.swift
//  HomeView
//
//  Created by Horacio Mota on 16/10/2023.
//

import SwiftUI

struct HomeView: View {
        var body: some View {
            TabBar()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HomeView()
        }.padding(.horizontal)
    }
}
