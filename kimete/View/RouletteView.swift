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
//    @State var category: Category
    @State var newItemText: String = ""

    
    var body: some View {
        ZStack{
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(categories){ category in
                            Button(action: {}) {
                                Text(category.name ?? "")
                                    .frame(width: 70, height: 20, alignment: .center)
                            }
                            .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                            .padding()
                        }
                    }
                }
                Spacer()
//                List{
//                    ForEach(itemArray(category.items)){ item in
//                        Text(item.name ?? "")
//                    }
//                }
//                .cornerRadius(20)
//                .softOuterShadow(darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, offset: 10, radius: 20)
//                .padding()
//                .background(Color.clear)
//                .onAppear {
//                    /// Listビュー表示時に初期データ登録処理を実行
//                    UITableView.appearance().backgroundColor = UIColor(Color.MyTheme.whiteShadow)
//                }
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
