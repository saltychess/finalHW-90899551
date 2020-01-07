//
//  CoffeeRow.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/3.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct CoffeeRow: View {
    var coffee :Coffee
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(coffee.name)
                Text("評分：\(Int(coffee.tasty))")
            }
            Spacer()
        }
    }
}
