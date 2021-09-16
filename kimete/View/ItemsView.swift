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
                    .padding(.vertical,20)
                List{
                    ForEach(itemArray(category.items)){ item in
                        Text(item.name ?? "")
                            .listRowBackground(Color.MyTheme.offWhite)
                    }
                    .onDelete(perform: deleteItem)
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = UIColor(Color.MyTheme.offWhite)
                }
                .cornerRadius(20)
                .softOuterShadow(darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, offset: 2, radius: 2)
                .listStyle(InsetGroupedListStyle())
                Spacer()
            }
            .padding()
            .accentColor(Color.MyTheme.redColor)
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
