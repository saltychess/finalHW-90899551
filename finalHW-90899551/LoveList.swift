//
//  LoveList.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/7.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct LoveList: View {
    @EnvironmentObject var love: likeData
    @State private var showEdit = false
    var body: some View {
        NavigationView {
            List {
                ForEach(love.likecoffee.indices, id:\.self) { (index) in
                    NavigationLink(destination: LoveDetail(editIndex: index)) {
                        LoveRow(love: self.love.likecoffee[index])
                    }
                }.onDelete { (indexSet) in
                    self.love.likecoffee.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("我的收藏")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.showEdit = true
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
                .sheet(isPresented: $showEdit) {
                    NavigationView {
                        Editor().environmentObject(self.love)
                    }
                   
            }
        }
    }
}

struct LoveList_Previews: PreviewProvider {
    static var previews: some View {
        LoveList().environmentObject(likeData())
    }
}
