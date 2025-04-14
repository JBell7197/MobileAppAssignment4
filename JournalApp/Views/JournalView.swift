//
//  JournalView.swift
//  JournalApp
//
//  Created by Justin Bell on 4/9/25.
//

import SwiftUI

struct JournalView: View {
    @StateObject var journalApp = JournalViewModel()
    @State var journal = JournalModel(title: "", entrydata: "")
    @StateObject var user = UserViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach($journalApp.journals) { $journal in
                    NavigationLink {
                        EntryView(journal: $journal)
                    } label: {
                        Text(journal.title)
                    }
                }
                Section {
                    NavigationLink {
                        EntryView(journal: $journal)
                    } label: {
                        Text("New Entry")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            .onAppear {
                journalApp.fetchData()
            }
            .refreshable {
                journalApp.fetchData()
            }
        }
    }
}

#Preview {
    JournalView()
}
