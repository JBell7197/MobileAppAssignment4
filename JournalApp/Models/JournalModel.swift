//
//  JournalModel.swift
//  JournalApp
//
//  Created by Justin Bell on 4/4/25.
//

import Foundation
import FirebaseFirestore

struct JournalModel: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var entrydata: String
}
