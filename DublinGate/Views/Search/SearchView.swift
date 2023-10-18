//
//  SearchView.swift
//  DublinGate
//
//  Created by Horacio Mota on 18/10/2023.
//

import SwiftUI

struct SearchView: View {
    @State var search = ""

    var body: some View {
        NavigationView() {
            List {
                HStack {
                    Text("When")
                    Spacer()
                    Text("Any Week")
                }
                .listRowSeparatorTint(Color.gray)
                
                HStack {
                    Text("Who")
                    Spacer()
                    Text("Add Guest")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Where in Ireland?")
            .searchable(text: $search)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
