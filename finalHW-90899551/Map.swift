//
//  Map.swift
//  finalHW-90899551
//
//  Created by User08 on 2020/1/6.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
import MapKit
struct MapView : UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        let region = MKCoordinateRegion(center: coordinate,latitudinalMeters:
        1000, longitudinalMeters:1000)
        mapView.setRegion(region, animated: true)
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}
