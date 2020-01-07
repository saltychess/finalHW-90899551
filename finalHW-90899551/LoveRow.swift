//
//  LoveRow.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/7.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct LoveRow: View {
    var love: likeCoffee
    var body: some View {
        VStack{
            Text(love.name)
            Text(love.city)
        }
    }
}

