//
//  BooksViewModel.swift
//  books
//
//  Created by Lisandro on 06/06/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    
    private var db = Firestore.firestore()
    func addBook(book: Book) {
        do {
            let _ = try db.collection("books").addDocument(from: book)
        } catch {
            print(error)
        }
    }
    func fetchData() {
        db.collection("books").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.books = documents.compactMap { queryDocumentSnapshot -> Book? in
                return try? queryDocumentSnapshot.data(as: Book.self)
                
//                let data = queryDocumentSnapshot.data()
//
//                let title = data["title"] as? String ?? ""
//                let author = data["author"] as? String ?? ""
//                let pages = data["numberOfPages"] as? Int ?? 0
//
//                return Book(title: title, author: author, pages: pages)
//
            }
        }
    }
}
