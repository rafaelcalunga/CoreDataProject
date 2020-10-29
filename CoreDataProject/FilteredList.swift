//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-29.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    
    var lines: FetchedResults<T> { fetchRequest.wrappedValue }
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(lines, id: \.self) { line in
            self.content(line)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K CONTAINS[c] %@", filterKey, filterValue))
        
        self.content = content
    }
}
