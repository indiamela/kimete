//
//  SettingsButtonView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/21.
//

import SwiftUI

struct SettingsButtonView: View {
    @State var title: String
    @State var action: settingsActions
    var body: some View {
        Button(action: {
            buttonAction(action: action)
        }) {
            Text(title)
                .foregroundColor(.gray)
        }
        .padding(.bottom,10)
        .buttonStyle(SimpleButtonStyle())
    }
    
    private func buttonAction(action: settingsActions){
        switch action {
        case .evaluate:
            // AppStoreURLへ遷移
            openCustomURL(urlString: "https://www.google.com")
            break
        case .shareApp:
            // アプリをシェア
            sharePost()
            break
        case .developer:
            // 開発者リンクに遷移
            openCustomURL(urlString: "https://www.google.com")
            break
        case .privacyPolicy:
            // プライバシーポリシー
            openCustomURL(urlString: "https://www.google.com")
            break
        }
    }
    
    func sharePost(){
        let massage = "これが俺たちのアプリだ!!"
        // TODO: - URL CHANGE
        let link = URL(string: "https://www.google.com")!
        let activityViewController = UIActivityViewController(activityItems: [massage,link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    func openCustomURL(urlString: String){
        guard let url = URL(string: urlString) else {return}
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView(title: "AppStoreで評価", action: settingsActions.evaluate)
            .previewLayout(.sizeThatFits)
    }
}
