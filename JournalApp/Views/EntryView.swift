//
//  JournalView.swift
//  JournalApp
//
//  Created by Justin Bell on 4/7/25.
//

import SwiftUI

struct EntryView: View {
    
    @Binding var journal : JournalModel
    @StateObject var journalApp = JournalViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Entry Title", text: $journal.title)
                .padding(.bottom, 30)
            TextEditor(text: $journal.entrydata)
                .padding(.bottom, 200)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    journalApp.saveData(journal: journal)
                    journal.title = ""
                    journal.entrydata = ""
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    EntryView(journal: .constant(JournalModel(title: "Justin", entrydata: "Bell")))
}
