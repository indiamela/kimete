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
    @NSManaged public var category_id: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var category: Category?

    static func create(in managedObjectContext:NSManagedObjectContext,
                       timestamp: Date? = Date(),
                       name: String,
                       categoryID: String) {
        let newItem = self.init(context: managedObjectContext)
        print("create new category \(name)")
        newItem.category_id = categoryID
        newItem.name = name
        newItem.timestamp = timestamp
        let fetchRequestCategory = NSFetchRequest<NSFetchRequestResult>()
        fetchRequestCategory.entity = Category.entity()
        fetchRequestCategory.predicate = NSPredicate(format: "id = %@", categoryID as CVarArg)
        let result = try? managedObjectContext.fetch(fetchRequestCategory) as? [Category]
        if result!.count > 0 {
            /// Item -> Categoryへのリレーション
            result![0].addToItems(newItem)
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

extension Item : Identifiable {

}
