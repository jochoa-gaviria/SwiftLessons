//
//  ElementoLista+CoreDataProperties.swift
//  testCoreData
//
//  Created by Juan on 17/1/23.
//
//

import Foundation
import CoreData


extension ElementoLista {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementoLista> {
        return NSFetchRequest<ElementoLista>(entityName: "ElementoLista")
    }

    @NSManaged public var nombre: String?

}

extension ElementoLista : Identifiable {

}
