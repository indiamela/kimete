//
//  prototypeDesignView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/20.
//

import SwiftUI

struct prototypeDesignView: View {
    var body: some View {
        ZStack {
            Color.MyTheme.offWhite
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.MyTheme.offWhite)
                    .modifier(ConvexModifier(width: 200, height: 200))
                
                Button(action: {
                    print("Button tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                }
                .buttonStyle(SimpleButtonStyle())
                
                Circle()
                    .fill(Color.MyTheme.offWhite)
                    .modifier(CircleModifier(width: 200, height: 200))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct prototypeDesignView_Previews: PreviewProvider {
    static var previews: some View {
        prototypeDesignView()
    }
}
