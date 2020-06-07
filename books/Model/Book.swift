//
//  Book.swift
//  books
//
//  Created by Lisandro on 06/06/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
struct Book: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    let title: String
    let author: String
    let pages: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages = "numberOfPages"
    }
    
}
