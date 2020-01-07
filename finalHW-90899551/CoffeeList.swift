//
//  CoffeeList.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/3.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct CoffeeList: View {
    @State private var coffees = [Coffee]()
    func fetchData() {
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes/taipei"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
              decoder.dateDecodingStrategy = .iso8601
              if let data = data, let cResults = try? decoder.decode([Coffee].self, from: data) {
                  self.coffees.append(contentsOf: cResults)
                }
            }.resume()
            
        }
    }
    var body: some View {
        NavigationView {
            List(coffees.indices, id: \.self) { (index) in
                NavigationLink(destination: CoffeeDetail(coffee: self.coffees[index])) {
                    CoffeeRow(coffee: self.coffees[index])}
            }.onAppear{
                if self.coffees.count == 0{
                    self.fetchData()
                }
            }
            }
        }
}


struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeList()
    }
}
