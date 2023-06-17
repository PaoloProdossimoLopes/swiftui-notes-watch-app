//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Paolo Prodossimo Lopes on 17/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("lineCounter") private var lineCounter = 1
    @State private var notes = [Note]()
    @State private var text = String()
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add new note", text: $text)
                
                Button(action: addActionHandler) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .bold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
            }
            
            Spacer()
            
            if notes.isEmpty {
                Spacer()
                
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                    .opacity(0.25)
                
                Spacer()
            } else {
                List {
                    ForEach(0..<notes.count, id: \.self) { index in
                        let note = notes[index]
                        NavigationLink(destination: DetailView(note: note, count: notes.count, index: index)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                
                                Text(note.text)
                                    .lineLimit(lineCounter)
                                    .padding(.leading, 5)
                            }
                        }
                    }
                    .onDelete { index in
                        delete(offset: index)
                    }
                }
            }
        }
        .onAppear(perform: dispatch(action: load))
        .navigationTitle("Notes")
    }
    
    private func addActionHandler() {
        guard !text.isEmpty else { return }
        
        let note = Note(id: UUID(), text: text)
        notes.append(note)
        
        text = ""
        
        save()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentNotePath()
            try data.write(to: url)
        } catch {
            debugPrint("Saving the note fails")
        }
    }
    
    private func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    
    private func getDocumentDirector() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    private func load() {
        do {
            let url = getDocumentNotePath()
            let data = try Data(contentsOf: url)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            notes = []
        }
    }
    
    private func dispatch(action: @escaping () -> Void) -> (() -> Void) {
        {
            DispatchQueue.main.async { [action] in
                action()
            }
        }
    }
    
    private func getDocumentNotePath() -> URL {
        let noteURL = getDocumentDirector().appendingPathComponent("notes")
        return noteURL
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
