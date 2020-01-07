//
//  ContentView.swift
//  finalHW-90899551
//
//  Created by User08 on 2019/12/30.
//  Copyright © 2019 ntou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var coffees = [Coffee]()
    @State private var taipei = false
    @State private var hsinchu = false
    @State private var kaohsiung = false
    @State private var likeApp = false
    var body: some View {
        VStack{
            Button(action: {
                self.taipei = true
            }){
                Image("1")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 400, height: 230)
            }.sheet(isPresented: self.$taipei){
                CoffeeList()
            }
            Button(action: {
                self.kaohsiung = true
            }){
                Image("3").renderingMode(.original).resizable().frame(width: 400, height: 230)
            }.sheet(isPresented: self.$kaohsiung){
                kaohsiungList()
            }
            Button(action: {
                self.hsinchu = true
            }){
                Image("4").renderingMode(.original).resizable().frame(width: 400, height: 230)
            }.sheet(isPresented: self.$hsinchu){
                hsinchuList()
            }
            Image(systemName: "heart.circle").contextMenu{
                Button(action: {
                    self.likeApp=true
                }){
                    Text("喜歡這個App")
                    Image(systemName: likeApp ? "heart.fill" : "heart")
                }
            }.frame(width: 50, height: 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
