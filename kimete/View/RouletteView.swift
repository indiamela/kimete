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
    @State var selectedCategory: Category?
    @State var isAnimation = false
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
                if let category = selectedCategory, category.items?.count ?? 0 > 0 {
                    RouletteContentView(symbols: itemArray(category.items))
                        .padding()
                }
                Spacer()
                Button(action: {
                    isAnimation.toggle()
                }) {
                    Image(systemName: "play.fill")
                }
                .softButtonStyle(Circle())
                .frame(width: 50, height: 50)
                .padding()
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
