//
//  JournalViewModel.swift
//  JournalApp
//
//  Created by Justin Bell on 4/7/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class JournalViewModel : ObservableObject {
    
    @Published var journals = [JournalModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.journals.removeAll()
        db.collection("journal").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        self.journals.append(try document.data(as: JournalModel.self))
                    } catch {
                        print(error)
                    }
                }
            }
        }
          
    }
    
    func saveData(journal: JournalModel) {

        if let id = journal.id {
            //edit entry
            if !journal.title.isEmpty || !journal.entrydata.isEmpty {
                let docRef = db.collection("journal").document(id)
                
                docRef.updateData([
                    "title": journal.title,
                    "entrydata": journal.entrydata
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    }
                    else {
                        print("Document successfully updated")
                    }
                }
            }
            
        }
        else {
            //Add entry
            
            if !journal.title.isEmpty || !journal.entrydata.isEmpty {
                var ref: DocumentReference? = nil
                ref = db.collection("journal").addDocument(data: [
                    "title": journal.title,
                    "entrydata": journal.entrydata
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
    }
}
