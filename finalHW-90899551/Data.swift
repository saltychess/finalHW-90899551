//
//  Data.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/4.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
import UIKit

struct Coffee: Decodable {
    var name :String
    var city: String
    var url: String
    var address:String
    var tasty:Double
}
struct CResults: Identifiable, Decodable {
    var id = UUID()
    var resultCount: Int
    var results: [Coffee]
}
struct likeCoffee: Decodable{
    var name :String
    var city: String
    var address:String
    var tasty:Double
    var isLike: Bool
    var detail:String
}

