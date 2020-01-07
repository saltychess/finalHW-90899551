//
//  kaohsiungList.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/6.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI

struct kaohsiungList: View {
    @State private var coffees2 = [Coffee]()
    func fetchkao() {
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes/kaohsiung"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
              decoder.dateDecodingStrategy = .iso8601
              if let data = data, let cResults = try? decoder.decode([Coffee].self, from: data) {
                  self.coffees2.append(contentsOf: cResults)
                }
            }.resume()
        }
    }
    var body: some View {
        NavigationView{
            List(coffees2.indices, id: \.self) { (index) in
                NavigationLink(destination: CoffeeDetail(coffee: self.coffees2[index])){
                    CoffeeRow(coffee: self.coffees2[index])}
            }.onAppear{
                if self.coffees2.count == 0{
                    self.fetchkao()
                }
            }
            }
        }
}

struct kaohsiungList_Previews: PreviewProvider {
    static var previews: some View {
        kaohsiungList()
    }
}
