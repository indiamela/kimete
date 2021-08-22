//
//  sampleListView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/22.
//

import SwiftUI

struct sampleListView: View {
    @Environment(\.managedObjectContext) private var context
    
    /// データ取得処理
    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.id, ascending: true)]
    ) private var categories: FetchedResults<Category>
    
    var body: some View {
        List {
            ForEach(categories) { category in
                Section(header: HStack {
                    Text("\(category.name ?? "")")
                }){
                    VStack(alignment: .leading) {
                        ForEach(itemArray(category.items), id: \.self) { item in
                            Text("\(item.category_id ?? "")  \(item.name ?? "")")
                        }
                    }
                }
            }
        }
        .onAppear {
            /// Listビュー表示時に初期データ登録処理を実行
            registSampleData(context: context)
        }
    }
    
    /// NSSet? → [Item]変換
    private func itemArray(_ items: NSSet?) -> [Item] {
        let set = items as? Set<Item> ?? []
        return set.sorted {
            $0.id < $1.id
        }
    }
}

struct sampleListView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        sampleListView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
