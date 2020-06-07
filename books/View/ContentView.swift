//
//  ContentView.swift
//  books
//
//  Created by Lisandro on 06/06/2020.
//  Copyright © 2020 Lisandro Falconi. All rights reserved.
//

import SwiftUI

//let testData = [
//    Book(title: "test", author: "test", pages: 1),
//    Book(title: "test2", author: "test2", pages: 10),
//    Book(title: "test3", author: "test2", pages: 100),
//]


struct ContentView: View {
    @ObservedObject private var viewModel = BooksViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.books) { book in
                VStack(alignment: .leading) {
                    Text(book.title).font(.headline)
                    Text(book.author).font(.subheadline)
                    Text("\(book.pages) pages").font(.subheadline)
                }
            }
        }
        .navigationBarTitle("Books")
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
