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
            VStack{
                Spacer()
                // MARK: SECTION SETTINGS
                GroupBox(label:SettingsLabelView(title: "Settings")) {
                    SettingsToggleView(title: "サウンド",toggle: $soundFlg)
                    SettingsToggleView(title: "バイブレーション",toggle: $vibrationFlg)
                    SettingsToggleView(title: "クイックモード",toggle: $quickMode)
                }
                .groupBoxStyle(SimpleGroupBoxStyle())
                Spacer()
                GroupBox(label:SettingsLabelView(title: "About")) {
                    SettingsButtonView(title: "App Storeで評価", action: settingsActions.evaluate)
                    SettingsButtonView(title: "アプリをシェア", action: settingsActions.shareApp)
                    SettingsButtonView(title: "開発者について", action: settingsActions.developer)
                    SettingsButtonView(title: "プライバイシーポリシー", action: settingsActions.privacyPolicy)
                }
                .groupBoxStyle(SimpleGroupBoxStyle())

                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
