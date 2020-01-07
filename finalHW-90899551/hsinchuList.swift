//
//  hsinchuList.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/6.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct hsinchuList: View {
    @State private var coffees3 = [Coffee]()
    func fetchhsinchu() {
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes/hsinchu"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
              decoder.dateDecodingStrategy = .iso8601
              if let data = data, let cResults = try? decoder.decode([Coffee].self, from: data) {
                  self.coffees3.append(contentsOf: cResults)
                }
            }.resume()
            
        }
    }
    var body: some View {
        NavigationView {
            List(coffees3.indices, id: \.self) { (index) in
                NavigationLink(destination: CoffeeDetail(coffee: self.coffees3[index])) {
                    CoffeeRow(coffee: self.coffees3[index])}
            }.onAppear{
                if self.coffees3.count == 0{
                    self.fetchhsinchu()
                }
            }
            }
        }
}

struct hsinchuList_Previews: PreviewProvider {
    static var previews: some View {
        hsinchuList()
    }
}
