//
//  ItemsView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/19.
//

import SwiftUI

struct ItemsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.id, ascending: true)]
    )
    private var categories: FetchedResults<Category>
    @State var newCategoryText: String = ""
    var category: Category
    
    var body: some View {
        ZStack{
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack{
                AddTextView(type: .item, categoryID: category.id)
                .padding()
                List{
                    ForEach(itemArray(category.items)){ item in
                        Text(item.name ?? "")
                    }
                    .onDelete(perform: deleteItem)
                }
                .cornerRadius(20)
                .softOuterShadow(darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, offset: 10, radius: 20)
                .padding()
                .background(Color.clear)
                .onAppear {
                    /// Listビュー表示時に初期データ登録処理を実行
                    UITableView.appearance().backgroundColor = UIColor(Color.MyTheme.whiteShadow)
                }
            }
        }
    }
    private func itemArray(_ items: NSSet?) -> [Item] {
        let set = items as? Set<Item> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }

    
    private func deleteItem(offsets: IndexSet) {
        for index in offsets {
            let item = itemArray(category.items)[index]
            viewContext.delete(item)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

//struct ItemsView_Previews: PreviewProvider {
//    @FetchRequest(
//        entity: Category.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \Category.id, ascending: true)]
//    )
//    var categories: FetchedResults<Category>
//    static var previews: some View {
//        let persistenceController = PersistenceController.shared
//        ItemsView(category: categories[0])
//            .environment(\.managedObjectContext, persistenceController.container.viewContext)
//
//    }
//}
