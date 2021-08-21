//
//  SettingsLabelView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/21.
//

import SwiftUI

struct SettingsLabelView: View {
    @State var title: String
    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
            
            Spacer()
        }
        .padding()
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(title: "Settings")
            .previewLayout(.sizeThatFits)
    }
}
