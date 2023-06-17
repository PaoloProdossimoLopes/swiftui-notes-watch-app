//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Paolo Prodossimo Lopes on 17/06/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCounter") private var lineCounter = 1
    @State private var value = Float(1)
    
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCounter)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: { value }, set: { newValue in
                value = newValue
                update()
            }), in: 1...4, step: 1)
            .tint(.accentColor)
            
        }
    }
    
    private func update() {
        lineCounter = Int(value)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
