//
//  GroupsView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/18.
//

import SwiftUI

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
                HStack{
                    TextField("add new group".uppercased(), text: $newCategoryText)
                        .modifier(TextFieldModifier(width: 300, height: 10))

                        
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }


                .padding()
                List{
                    ForEach(categories) {category in
                        Text(category.name ?? "")
                    }
                }
                .cornerRadius(20)
                .padding()
                .modifier(ConvexModifier())
                .onAppear {
                    /// Listビュー表示時に初期データ登録処理を実行
                    registSampleData(context: viewContext)
                }
            }
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
