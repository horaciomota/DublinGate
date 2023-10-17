//
//  PropretyPage.swift
//  DublinGate
//
//  Created by Horacio Mota on 17/10/2023.
//

import SwiftUI

struct PropretyPage: View {
//    let property: DublinGateResponse

    var body: some View {
//        Text(property.name)
        Text("Nome da propriedade")
            .font(.system(size: 18, weight: .bold))
    }
}

struct PropretyPage_Previews: PreviewProvider {
    static var previews: some View {
        PropretyPage()
    }
}
