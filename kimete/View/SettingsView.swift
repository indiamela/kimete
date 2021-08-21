//
//  SettingsView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/17.
//

import SwiftUI

struct SettingsView: View {
    @State var soundFlg = false
    @State var vibrationFlg = false
    @State var quickMode = false

    var body: some View {
        ZStack {
            Color.MyTheme.offWhite
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                // MARK: SECTION SETTINGS
                GroupBox(label:
                            HStack{
                                Text("Settings")
                                Spacer()
                            }
                            .padding()
                            
                ) {
                    SettingsToggleView(toggle: $soundFlg)
                    SettingsToggleView(toggle: $vibrationFlg)
                    SettingsToggleView(toggle: $quickMode)

                    Button(action: {
                        print("Button tapped")
                    }) {
                        Text("Placeholder")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(SimpleButtonStyle())
                }
                .groupBoxStyle(SimpleGroupBoxStyle())
                Spacer()
            }
        }
//        .navigationBarTitle("Settings", displayMode: .large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
