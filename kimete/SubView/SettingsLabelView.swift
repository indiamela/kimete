//
//  SettingsLabelView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/19.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var lavelImage: String
    
    var body: some View {
        //Rectangle
        // Composition groups need to live inside some a stack. (VStack, ZStack, or HStack)

        ZStack {
            RoundedRectangle(cornerRadius: 10)
            .fill(Color(#colorLiteral(red: 0.9058823585510254, green: 0.9215686321258545, blue: 0.9411764740943909, alpha: 1)))

            RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 1)]),
                    startPoint: UnitPoint(x: 1.5495049963412084, y: 0.4999999911832471),
                    endPoint: UnitPoint(x: 0.5495049653556753, y: -0.5990098845766916)))
            .blendMode(.softLight)

            RoundedRectangle(cornerRadius: 10)
            .strokeBorder(LinearGradient(
                    gradient: Gradient(stops: [
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0),
                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]),
                    startPoint: UnitPoint(x: -0.04407295688981422, y: 1.1691787094036954e-7),
                    endPoint: UnitPoint(x: 1.0739644870852096, y: 1.0696862540771797)), lineWidth: 1)
            .blendMode(.hardLight)
        }
        .compositingGroup()
        .frame(width: 333, height: 191)
        .rotationEffect(.degrees(0))
        .shadow(color: Color(#colorLiteral(red: 0.651199996471405, green: 0.6689599752426147, blue: 0.7400000095367432, alpha: 1)), radius:10, x:5, y:5)
//        VStack {
//            HStack{
//                Image(systemName: lavelImage)
//                Text(labelText)
//                    .fontWeight(.bold)
//                Spacer()
//            }
//
//            Divider()
//                .padding(.vertical,4)
//        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Test Label", lavelImage: "heart")
            .previewLayout(.sizeThatFits)
    }
}
