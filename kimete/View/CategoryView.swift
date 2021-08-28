//
//  GroupsView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/18.
//

import SwiftUI
import Neumorphic

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
                addTextView(type: .category)
//                HStack {
//                    TextField("add new group".uppercased(), text: $newCategoryText)
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.MyTheme.offWhite)
//                                .frame(height: 40)
//                                .softInnerShadow(RoundedRectangle(cornerRadius: 10), darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, spread: 0.5, radius: 2)
//                        )
//
//                    Button(action: {
//                        addCategory()
//                    }, label: {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.title)
//                    })
//                }
//                .padding()
                List{
                    ForEach(categories) {category in
                        NavigationLink(
                            destination: ItemsView(),
                            label: {
                                Text(category.name ?? "")
                            })
                    }
                    .onDelete(perform: deleteCategory)
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
    
    private func addCategory() {
        withAnimation {
            let newCategory = Category(context: viewContext)
            newCategory.id = UUID().uuidString
            newCategory.name = newCategoryText
            newCategory.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        newCategoryText = ""
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
