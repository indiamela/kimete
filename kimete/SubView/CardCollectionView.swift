//
//  CardCollectionView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/09/14.
//

import SwiftUI

struct CardCollectionView: View {
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.Neumorphic.main)
            .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
            .softInnerShadow(RoundedRectangle(cornerRadius: 10))
            .overlay(
                HStack {
                    Text(text)
                    Spacer()
                }
                .padding(.horizontal)
            )
    }
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardCollectionView(text: "晩ごはん")
            .previewLayout(.sizeThatFits)
    }
}
