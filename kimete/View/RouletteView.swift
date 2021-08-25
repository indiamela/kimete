//
//  RouletteView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import SwiftUI

struct RouletteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Category.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Category.id, ascending: true)])
    private var categories: FetchedResults<Category>
    @State var newItemText: String = ""

    
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                List{
//                    ForEach(itemArray(categories[0].items), id: \.self) { item in
//                        Text("\(item.name ?? "")")
//                    }
                }
            }
            .onAppear {
                registSampleData(context: viewContext)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                NavigationLink(
                    destination: CategoryView(),
                    label: {
                        Image(systemName: "line.horizontal.3")
                    })
            }
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
    

    
    /// NSSet? → [Item]変換
    private func itemArray(_ items: NSSet?) -> [Item] {
        let set = items as? Set<Item> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }
}

struct RouletteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RouletteView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
