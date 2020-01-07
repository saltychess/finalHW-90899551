//
//  LoveDetail.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/7.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct LoveDetail: View {
    @EnvironmentObject var love: likeData
    @State private var scale:CGFloat = 1
    var editIndex: Int
    var body: some View {
        let loveCoffee = love.likecoffee[editIndex]
        return List{
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipped()
                .gesture(MagnificationGesture().onChanged{ value in
                    self.scale=value.magnitude})
            Text(loveCoffee.name)
            Text(loveCoffee.address)
            Text(loveCoffee.detail)
        }
    }
}

