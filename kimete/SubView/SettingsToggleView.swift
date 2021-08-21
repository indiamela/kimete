//
//  SettingsLabelView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/19.
//

import SwiftUI

struct SettingsToggleView: View {
    @State var title: String
    @Binding var toggle: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.MyTheme.offWhite)
            .frame(height:60)
            .overlay(
                HStack {
                    Text(title)
                        .foregroundColor(.gray)
                    Spacer()
                    Toggle(isOn: $toggle, label: {
                        
                    })
                    .toggleStyle(SimpleToggleStyle())
                }
                .padding()
            )
            .modifier(ConvexModifier())
    }
}

struct SettingsToggleView_Previews: PreviewProvider {
    @State static var toggle: Bool = false
    static var previews: some View {
        SettingsToggleView(title: "サウンド", toggle: $toggle)
            .previewLayout(.sizeThatFits)
    }
}
