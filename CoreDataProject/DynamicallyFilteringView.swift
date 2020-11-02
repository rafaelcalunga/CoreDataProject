//
//  DynamicallyFilteringView.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-29.
//

import SwiftUI

struct DynamicallyFilteringView: View {
    @Environment(\.managedObjectContext) private var context
    
    @State private var titleFilter = "A"

    private let sortDescriptors: [NSSortDescriptor] = [
        NSSortDescriptor(keyPath: \Movie.title, ascending: true),
        NSSortDescriptor(keyPath: \Movie.director, ascending: true)
    ]
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "title", filterValue: self.titleFilter, sortDescriptors: sortDescriptors) { (movie: Movie) in
                VStack(alignment: .leading) {
                    Text("\(movie.wrappedTitle)")
                        .font(.headline)
                    Text("\(movie.wrappedDirector)")
                }
            }

            Button("Add Examples") {
                let avatar = Movie(context: self.context)
                avatar.title = "Avatar"
                avatar.director = "James Cameron"
                
                let titanic = Movie(context: self.context)
                titanic.title = "Titanic"
                titanic.director = "James Cameron"
                
                let et = Movie(context: self.context)
                et.title = "ET"
                et.director = "Steven Spielberg"
                
                let jurassic = Movie(context: self.context)
                jurassic.title = "Jurassic Park"
                jurassic.director = "Steven Spielberg"
                
                try? self.context.save()
            }
            
            Button("Show A") {
                self.titleFilter = "A"
            }

            Button("Show T") {
                self.titleFilter = "T"
            }
        }
    }
}

struct DynamicallyFilteringView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicallyFilteringView()
    }
}
