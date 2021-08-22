//
//  UIStyles.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/22.
//

import Foundation
import SwiftUI

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let blackShadow = Color.black.opacity(0.2)
        let whiteShadow = Color.white.opacity(0.7)
                configuration.label
                    .frame(width: UIScreen.main.bounds.width-30)
                    .padding(.vertical,20)
                    .background(
                            Rectangle()
                                .fill(Color.MyTheme.offWhite)
                                .cornerRadius(10)
                                .shadow(color: configuration.isPressed ? blackShadow : whiteShadow , radius: 10, x: configuration.isPressed ? 10 : -5, y: configuration.isPressed ? 10 : -5)
                                .shadow(color: configuration.isPressed ? whiteShadow : blackShadow , radius: 10, x: configuration.isPressed ? -5 : 10, y: configuration.isPressed ? -5 : 10)
                    )
    }
}

struct SimpleCircleButtonStyle: ButtonStyle {
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


struct SimpleGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width)
        configuration.content
            .frame(width: UIScreen.main.bounds.width)
            .background(Color.clear)
    }
}

struct SimpleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let blackShadow = Color.black.opacity(0.2)
        let whiteShadow = Color.white.opacity(0.7)
        HStack {
            configuration.label
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 50, height: 30, alignment: .center)
                .overlay((
                    Circle()
                        .fill(Color.MyTheme.offWhite)
                        .foregroundColor(Color(.systemBackground))
                        .padding(3)
                        .offset(x: configuration.isOn ? 10 : -10, y: 0)
                        .animation(.linear)
                ))
                .shadow(color: configuration.isOn ? blackShadow : whiteShadow , radius: 10, x: configuration.isOn ? 10 : -5, y: configuration.isOn ? 10 : -5)
                .shadow(color: configuration.isOn ? whiteShadow : blackShadow , radius: 10, x: configuration.isOn ? -5 : 10, y: configuration.isOn ? -5 : 10)
                .foregroundColor(configuration.isOn ? Color.MyTheme.redColor : Color.black)
                .onTapGesture(perform: {
                    configuration.isOn.toggle()
                })

        }

    }

}

struct ConvexModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width-30)
            .padding(.bottom,10)
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
