//
//  MapView.swift
//  MySports
//
//  Created by yvan pussard on 24/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//
import SwiftUI
import MapKit

final class Checkpoint: NSObject, MKAnnotation {

  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

struct MapView: UIViewRepresentable {
@State var currentActivity: ActivitiesItem
    
@State var basketCheckpoints: [Checkpoint] = [
     Checkpoint(title: "Street Park de montredon", coordinate: .init(latitude:   43.23486328125, longitude: 5.360050201416016)),
    Checkpoint(title: "Gymnase du Mont-Rose", coordinate: .init(latitude:   43.229362, longitude: 5.351216))
   ]
@State var footCheckpoints: [Checkpoint] = [
    Checkpoint(title: "Stade Roger Ebrard", coordinate: .init(latitude:   45.7204944, longitude: 4.8852208)),
    Checkpoint(title: "Stade Vuillermet", coordinate: .init(latitude:   45.72590255737305, longitude: 4.880788803100586))
 ]
@State var tennisCheckpoints: [Checkpoint] = [
    Checkpoint(title: "Tennis Club Montval", coordinate: .init(latitude:   43.251568, longitude: 5.410995)),
    Checkpoint(title: "Gymnase Desautel", coordinate: .init(latitude:   43.255382, longitude:  5.40659))
    ]
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
      
    func updateUIView(_ uiView: MKMapView, context: Context) {
//        let coordinate = CLLocationCoordinate2D(latitude:   43.23486328125, longitude: 5.360050201416016)
        let span = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)

        if self.currentActivity.name == "Basketball" {
            let coordinate = CLLocationCoordinate2D(latitude:   43.23486328125, longitude: 5.360050201416016)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
           uiView.addAnnotations(basketCheckpoints)
        } else if self.currentActivity.name == "Football"{
            let coordinate = CLLocationCoordinate2D(latitude:   45.7204944, longitude: 4.8852208)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
            uiView.addAnnotations(footCheckpoints)
        }else if self.currentActivity.name == "Tennis"{
            let coordinate = CLLocationCoordinate2D(latitude:   43.255382, longitude: 5.40659)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
            uiView.addAnnotations(tennisCheckpoints)
        }else{
            let coordinate = CLLocationCoordinate2D(latitude:   43.23486328125, longitude: 5.360050201416016)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)
            uiView.addAnnotations(basketCheckpoints)
        }

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(currentActivity: ActivitiesItem(name: "Basketball", image: "Lebron", color: Color.purple))
    }
}

