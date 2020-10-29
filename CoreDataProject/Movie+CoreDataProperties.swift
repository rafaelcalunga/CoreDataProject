//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-27.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var year: Int16
    @NSManaged public var title: String?
    @NSManaged public var director: String?
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedDirector: String {
        director ?? "Unknown Director"
    }
}

extension Movie : Identifiable {

}
