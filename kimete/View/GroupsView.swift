//
//  GroupsView.swift
//  kimete
//
//  Created by Taishi Kusunose on 2021/08/18.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        Text("GroupsView")
            .navigationBarTitle("グループ", displayMode: .inline)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GroupsView()
        }
    }
}
