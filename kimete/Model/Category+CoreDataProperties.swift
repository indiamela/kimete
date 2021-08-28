//
//  Category+CoreDataProperties.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/22.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var items: NSSet?
    
    static func create(in managedObjectContext:NSManagedObjectContext,
                       timestamp: Date? = Date(),
                       name: String,
                       id: String? = UUID().uuidString) {
        let category = self.init(context: managedObjectContext)
        print("create new category \(name)")
        category.id = id
        category.name = name
        category.timestamp = timestamp
        
        do {
            try managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

}

// MARK: Generated accessors for items
extension Category {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Category : Identifiable {

}
