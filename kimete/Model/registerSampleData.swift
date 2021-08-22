//
//  registerSampleData.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/22.
//

import CoreData
import SwiftUI
 
func registSampleData(context: NSManagedObjectContext) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    
    /// Studentテーブル初期値
    let itemList = [
        ["1", "カレー", Date()],
        ["2", "Mike", Date()],
        ["1", "パン", Date()],
        ["2", "Kate", Date()],
        ["3", "???", Date()]
    ]
        
    /// Categoryテーブル初期値
    let categoryList = [
        ["1","ごはん", Date()],
        ["2","掃除担当",Date()]
    ]
    
    /// Itemテーブル全消去
    let fetchRequestItem = NSFetchRequest<NSFetchRequestResult>()
    fetchRequestItem.entity = Item.entity()
    let items = try? context.fetch(fetchRequestItem) as? [Item]
    for item in items! {
        context.delete(item)
    }
    
    /// Categoryテーブル全消去
    let fetchRequestCategory = NSFetchRequest<NSFetchRequestResult>()
    fetchRequestCategory.entity = Category.entity()
    let categories = try? context.fetch(fetchRequestCategory) as? [Category]
    for category in categories! {
        context.delete(category)
    }
    
    /// Categoryテーブル登録
    for category in categoryList {
        let newCategory = Category(context: context)
        newCategory.id = UUID().uuidString
        newCategory.name = category[1] as? String
        newCategory.timestamp = Date()
    }
    
    /// Itemテーブル登録
    for item in itemList {
        let newItem = Item(context: context)
        newItem.category_id = item[0] as? String
        newItem.name = item[1] as? String
        newItem.timestamp = Date()
 
        /// リレーションの設定
        fetchRequestCategory.predicate = NSPredicate(format: "id = %@", item[0] as! CVarArg)
        let result = try? context.fetch(fetchRequestCategory) as? [Category]
        if result!.count > 0 {
            /// Item -> Categoryへのリレーション
            result![0].addToItems(newItem)
        }
    }
    
    /// コミット
    try? context.save()
}
