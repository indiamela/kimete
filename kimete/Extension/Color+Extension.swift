//
//  Color+Extension.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import Foundation
import SwiftUI

extension Color{
    struct MyTheme{
        static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
        static var redColor:Color{
            return Color("Red")
        }
        static let blackShadow = Color.black.opacity(0.2)
        static let whiteShadow = Color.white.opacity(0.7)
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
