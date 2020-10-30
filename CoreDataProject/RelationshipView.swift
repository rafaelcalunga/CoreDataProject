//
//  RelationshipView.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-30.
//

import SwiftUI

struct RelationshipView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Country.entity(), sortDescriptors: [])
    var countries: FetchedResults<Country>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            .navigationTitle("Candies")
            .toolbar(content: {
                Button(action: addCandies) {
                    Image(systemName: "plus")
                }
            })
        }
    }
    
    func addCandies() {
        let candy1 = Candy(context: self.context)
        candy1.name = "Mars"
        candy1.origin = Country(context: self.context)
        candy1.origin?.shortName = "UK"
        candy1.origin?.fullName = "United Kingdom"
        
        let candy2 = Candy(context: self.context)
        candy2.name = "KitKat"
        candy2.origin = Country(context: self.context)
        candy2.origin?.shortName = "UK"
        candy2.origin?.fullName = "United Kingdom"
        
        let candy3 = Candy(context: self.context)
        candy3.name = "Twix"
        candy3.origin = Country(context: self.context)
        candy3.origin?.shortName = "UK"
        candy3.origin?.fullName = "United Kingdom"
        
        let candy4 = Candy(context: self.context)
        candy4.name = "Toblerone"
        candy4.origin = Country(context: self.context)
        candy4.origin?.shortName = "CH"
        candy4.origin?.fullName = "Switzerland"
        
        try? self.context.save()
    }
}

struct RelationshipView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
