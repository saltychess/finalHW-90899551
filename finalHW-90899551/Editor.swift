//
//  Editor.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/6.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
struct Editor: View {
    @EnvironmentObject var loveData: likeData
    var editIndex: Int?
    @State private var selectedCity = "台北"
    @State private var showphoto = false
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var address = ""
    @State private var city = ""
    @State private var detail = ""
    @State private var trueHeart = true
    @State private var tasty = 0
    var body: some View {
        Form {
            TextField("店名", text: $name)
            Picker(selection: $city, label: Text("選擇城市")){
                Text("台北")
                Text("高雄")
                Text("新竹")
            }.pickerStyle(SegmentedPickerStyle())
            TextField("地址", text: $address)
            Toggle("Like", isOn: $trueHeart)
            Stepper("評分 \(tasty)", value: $tasty, in: 0...5,step: 1)
            TextField("詳細評價", text: $detail)
            Button(action:{
                self.showphoto = true
            }){
                Text("上傳照片")
            }.sheet(isPresented: $showphoto){
                ImagePickerController()
            }
        }
        .navigationBarTitle(editIndex == nil ? "Add new coffee" : "Edit coffee")
        .navigationBarItems(trailing: Button("Save") {
            let mylove = likeCoffee(name: self.name,city: self.city, address: self.address,tasty: (Double)(self.tasty), isLike: self.trueHeart,detail: self.detail)
            if let editIndex = self.editIndex {
                self.loveData.likecoffee[editIndex] = mylove
            } else {
                self.loveData.likecoffee.insert(mylove, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .onAppear {
                if let editIndex = self.editIndex {
                    let editLove = self.loveData.likecoffee[editIndex]
                    self.name = editLove.name
                    self.address = editLove.address
                    self.city = editLove.city
                    self.tasty = Int(editLove.tasty)
                    self.trueHeart = editLove.isLike
                }
        }
    }
}

struct Editor_Previews: PreviewProvider {
    static var previews: some View {
        Editor()
    }
}
