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
        Rectangle()
            .fill(Color.Neumorphic.main)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 50, alignment: .center)
            .overlay(
                HStack {
                    Text(text)
                    Spacer()
                }
                .padding(.horizontal)
            )
            .foregroundColor(.black)
    }
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardCollectionView(text: "晩ごはん")
            .previewLayout(.sizeThatFits)
    }
}
