//
//  Item+CoreDataProperties.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var category: Category?

}

extension Item : Identifiable {

}
