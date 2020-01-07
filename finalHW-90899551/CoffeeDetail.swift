//
//  CoffeeDetail.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/5.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
import MapKit
struct CoffeeDetail: View {
    @State private var coffees = [Coffee]()
    var coffee:Coffee
    var body: some View {
        List{
            MapView(coordinate: CLLocationCoordinate2D(latitude: 25.0, longitude: 121.0)).frame(width: 300, height: 300)
            Text(coffee.city)
            Text(coffee.name)
            Text(coffee.address)
            Text(coffee.url)
        }
    }
}

