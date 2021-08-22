//
//  sampleListView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/22.
//

import SwiftUI

struct sampleListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    /// データ取得処理
    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.id, ascending: true)]
    )
    private var categories: FetchedResults<Category>
    
    @State var newCategoryText: String = ""
    @State var newItemText: String = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                TextField("New Category", text: $newCategoryText)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                Button(action: {
                    addCategory()
                }, label: {
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                })
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
            
            List {
                ForEach(categories) { category in
                    Section(header: VStack {
                        Text("\(category.name ?? "")")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        HStack(spacing: 16) {
                            TextField("New Item", text: $newItemText)
                                .cornerRadius(10)
                                .background(Color.white)
                            Button(action: {
                                addItem(category: category)
                            }, label: {
                                Text("SAVE")
                            })
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(10)
                        }
                        .padding()
                    }){
                        VStack(alignment: .leading) {
                            ForEach(itemArray(category.items), id: \.self) { item in
                                Text("\(item.name ?? "")")
                            }
                        }
                    }
                }
            }
            .onAppear {
                /// Listビュー表示時に初期データ登録処理を実行
                registSampleData(context: viewContext)
            }
        }
    }
    
    /// NSSet? → [Item]変換
    private func itemArray(_ items: NSSet?) -> [Item] {
        let set = items as? Set<Item> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }
    
    private func addItem(category: Category) {
        withAnimation {
            
            let newItem = Item(context: viewContext)
            newItem.name = newItemText
            newItem.timestamp = Date()
            newItem.category_id = category.id
            category.addToItems(newItem)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        newItemText = ""
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
}

struct sampleListView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        sampleListView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
