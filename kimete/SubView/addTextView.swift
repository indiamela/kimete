//
//  addTextView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/28.
//

import SwiftUI

struct addTextView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var type: createType
    @State var text = ""
    
    var body: some View {
        HStack {
            TextField("add new group".uppercased(), text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.MyTheme.offWhite)
                        .frame(height: 40)
                        .softInnerShadow(RoundedRectangle(cornerRadius: 10), darkShadow: Color.MyTheme.blackShadow, lightShadow: Color.MyTheme.whiteShadow, spread: 0.5, radius: 2)
                )
            
            Button(action: {
                addCategory()
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            })
        }
    }
    
    private func addCategory() {
        withAnimation {
            let newCategory = Category(context: viewContext)
            newCategory.id = UUID().uuidString
            newCategory.name = text
            newCategory.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        text = ""
    }
}

struct addTextView_Previews: PreviewProvider {
    static var previews: some View {
        addTextView(type: .category)
    }
}
