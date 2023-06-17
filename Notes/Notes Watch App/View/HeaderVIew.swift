//
//  HeaderVIew.swift
//  Notes Watch App
//
//  Created by Paolo Prodossimo Lopes on 17/06/23.
//

import SwiftUI

struct HeaderView: View {
    var title = ""
    
    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            HStack {
              Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView()
            
            HeaderView(title: "Title")
        }
    }
}
