//
//  Countries+CoreDataProperties.swift
//  TableViews
//
//  Created by Juan on 18/1/23.
//
//

import Foundation
import CoreData


extension Countries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Countries> {
        return NSFetchRequest<Countries>(entityName: "Countries")
    }

    @NSManaged public var name: String?

}

extension Countries : Identifiable {

}
