//
//  addTextView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/28.
//

import SwiftUI

struct AddTextView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var type: createType
    @State var text = ""
    var categoryID: String?
    
    var body: some View {
        HStack {
            TextField.init((type == .category ? "add new group" : "add new item").uppercased(), text: $text,onCommit: addText)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.MyTheme.offWhite)
                        .frame(height: 40)
                        .softInnerShadow(RoundedRectangle(cornerRadius: 10), darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, spread: 0.5, radius: 2)
                )
            
            Button(action: {
                addText()
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            })
        }
    }
    
    private func addText() {
        guard text.count > 0 else { return }
            switch type {
            case .category:
                Category.create(in: viewContext, name: text)
            case .item:
                Item.create(in: viewContext, name: text, categoryID: categoryID!)
            }
            text = ""
    }
}

struct AddTextView_Previews: PreviewProvider {
    static var previews: some View {
        AddTextView(type: .category)
    }
}
