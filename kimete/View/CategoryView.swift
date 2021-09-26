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
    @State var showAlert: Bool = false
    @State var tapItem: Bool = false
    @State var text = ""
    @State var index = 0
    
    var body: some View {
        ZStack{
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack{
                AddTextView(type: .category)
                    .padding()
                    .padding(.bottom,20)
                List {
                    ForEach(categories) {category in
                        Text(category.name ?? "")
                            .onTapGesture {
                                index = categories.firstIndex(where: {$0.name == category.name ?? ""})!
                                tapItem.toggle()
                            }
                            .sheet(isPresented: $tapItem, content: {
                                ItemsView(categoryIndex: index)
                            })
                            .listRowBackground(Color.MyTheme.offWhite)
                    }
                    .onDelete(perform:deleteCategory)
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
