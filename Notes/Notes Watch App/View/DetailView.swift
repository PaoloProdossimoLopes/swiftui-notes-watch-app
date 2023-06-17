//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Paolo Prodossimo Lopes on 17/06/23.
//

import SwiftUI

struct DetailView: View {
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditPresented = false
    @State private var isSettingPresented = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            HeaderView()
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                Button(action: { isSettingPresented = true }) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                }
                .foregroundColor(.gray)
                .sheet(isPresented: $isSettingPresented) {
                    SettingsView()
                }
                    
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Button(action: { isCreditPresented = true }) {
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                }
                .foregroundColor(.gray)
                .sheet(isPresented: $isCreditPresented) {
                    CreditView()
                }
            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            note: Note(id: UUID(), text: "some note here!"),
            count: 2,
            index: 4
        )
    }
}
