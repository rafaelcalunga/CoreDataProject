//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-29.
//

import SwiftUI

struct FilteredList: View {
    
    var fetchRequest: FetchRequest<Movie>
    
    var movies: FetchedResults<Movie> { fetchRequest.wrappedValue }
    
    var body: some View {
        List(movies, id: \.self) { movie in
            VStack(alignment: .leading) {
                Text("\(movie.wrappedTitle)")
                Text("\(movie.wrappedDirector)")
                    .foregroundColor(.secondary)
            }
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Movie>(entity: Movie.entity(), sortDescriptors: [], predicate: NSPredicate(format: "title CONTAINS[c] %@", filter))
    }
}
