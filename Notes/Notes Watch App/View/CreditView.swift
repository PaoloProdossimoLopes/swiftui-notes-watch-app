//
//  CreditView.swift
//  Notes Watch App
//
//  Created by Paolo Prodossimo Lopes on 17/06/23.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack(spacing: 3) {
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            HeaderView(title: "Credits")
            
            Text("Paolo Prodossimo Lopes")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
