//
//  Date+Extension.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/16.
//

import Foundation
import SwiftUI

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let blackShadow = Color.black.opacity(0.2)
        let whiteShadow = Color.white.opacity(0.7)
                configuration.label
                    .padding(30)
                    .background(
                            Circle()
                                .fill(Color.MyTheme.offWhite)
                                .shadow(color: configuration.isPressed ? blackShadow : whiteShadow , radius: 10, x: configuration.isPressed ? 10 : -5, y: configuration.isPressed ? 10 : -5)
                                .shadow(color: configuration.isPressed ? whiteShadow : blackShadow , radius: 10, x: configuration.isPressed ? -5 : 10, y: configuration.isPressed ? -5 : 10)
                    )
    }
}

struct ConvexModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

struct CircleModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                Circle()
                    .stroke(Color.gray, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
            )
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 8)
                    .blur(radius: 4)
                    .offset(x: -2, y: -2)
                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
            )
            .frame(width: width, height: height)
    }
}
