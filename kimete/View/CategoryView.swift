//
//  GroupsView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/18.
//

import SwiftUI
import Neumorphic
import CoreData

struct CategoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    /// データ取得処理
    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.id, ascending: true)]
    )
    private var categories: FetchedResults<Category>
    @State var newCategoryText: String = ""

    
    var body: some View {
        ZStack{
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack{
                AddTextView(type: .category)
                .padding()
                List{
                    ForEach(categories) {category in
                        NavigationLink(
                            destination: ItemsView(category: category),
                            label: {
                                Text(category.name ?? "")
//                                CardCollectionView(text: category.name ?? "")
                            })
                            .listRowBackground(Color.MyTheme.offWhite)
                    }
                    .onDelete(perform: deleteCategory)
                }
                .listStyle(SidebarListStyle())
                .cornerRadius(20)
                .softOuterShadow(darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, offset: 10, radius: 20)
                .padding()
            }
        }
    }
        
    private func deleteCategory(offsets: IndexSet) {
        for index in offsets {
            let category = categories[index]
            viewContext.delete(category)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        NavigationView{
            CategoryView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}

enum createType {
    case category
    case item
}
