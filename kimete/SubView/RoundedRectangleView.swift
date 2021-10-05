//
//  RoundedRectangleView.swift
//  kimete
//
//  Created by 堀畑龍之介 on 2021/10/06.
//

import SwiftUI
import Neumorphic

struct RoundedRectangleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.Neumorphic.main)
            .softOuterShadow()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView()
            .previewLayout(.sizeThatFits)
    }
}
