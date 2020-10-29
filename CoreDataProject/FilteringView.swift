//
//  FilteringView.swift
//  CoreDataProject
//
//  Created by Rafael Calunga on 2020-10-28.
//

import SwiftUI
import CoreData

struct FilteringView: View {
    @Environment(\.managedObjectContext) private var context
    
    //NSPredicate(format: "universe == %@", "Star Wars"))
    //NSPredicate(format: "name < %@", "F"))
    //NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
    //NSPredicate(format: "name BEGINSWITH %@", "E"))
    
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars"))
    private var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknow name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: self.context)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.context)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.context)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.context)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"

                try? self.context.save()
            }
        }
    }
}

struct FilteringView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringView()
    }
}
