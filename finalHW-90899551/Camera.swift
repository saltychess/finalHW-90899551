//
//  Camera.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/7.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
import UIKit
struct ImagePickerController: UIViewControllerRepresentable{
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerController>) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerController>) {
        
    }
}

