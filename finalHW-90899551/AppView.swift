//
//  AppView.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/3.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View{
        let love = likeData()
        return TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "info.circle")
                    Text("首頁")
                }
            LoveList()
                .tabItem{
                Image(systemName: "music.house")
                Text("詳細介紹")
            }
           
        }.environmentObject(love)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
