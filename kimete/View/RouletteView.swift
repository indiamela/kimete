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
    @State var selected: Int = 0
    @State var selectedCategory: Category?
    @AppStorage("category_index") var categoryIndex: Int?
    
    var body: some View {
        ZStack{
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(categories){ category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.name ?? "")
                                    .frame(height: 20, alignment: .center)
                            }
                            .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                            .padding()
                        }
                    }
                }
                Spacer()
                ZStack{
                    Circle()
                        .fill(Color.Neumorphic.main)
                        .softOuterShadow()
                        .frame(height: 300, alignment: .center)
                }
                .padding()
                Spacer()
                Circle()
                    .fill(Color.Neumorphic.main)
                    .softOuterShadow()
                    .frame(height: 50, alignment: .center)
                
//                List{
//                    if let category = selectedCategory, category.items?.count ?? 0 > 0 {
//                        ForEach(itemArray(category.items)){ item in
//                            Text(item.name ?? "")
//                        }
//                        .listRowBackground(Color.MyTheme.offWhite)
//                    } else {
//                        Text("カテゴリを作成してください")
//                            .listRowBackground(Color.MyTheme.offWhite)
//                    }
//                }
//                .cornerRadius(20)
//                .softOuterShadow(darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, offset: 2, radius: 2)
//                .listStyle(InsetGroupedListStyle())
//                .padding()
//                Spacer()
            }
        }
        .toolbar {
            NavigationLink(
                destination: CategoryView(),
                label: {
                    Image(systemName: "line.horizontal.3")
                })
        }
    }
    
    
    /// NSSet? → [Item]変換
    private func itemArray(_ items: NSSet?) -> [Item] {
        let set = items as? Set<Item> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }
    
    private func changeCategory() {
        
    }
}

//struct RouletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            RouletteView()
//                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
//        }
//    }
//}
