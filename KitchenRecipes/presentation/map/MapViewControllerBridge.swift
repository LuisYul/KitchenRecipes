//
//  MapViewControllerBridge.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 31/08/22.
//

import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
    var recipe: KitchenRecipeEntity
    var onAnimationEnded: () -> ()

    func makeUIViewController(context: Context) -> MapViewController {
    return MapViewController()
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        animateToSelectedMarker(viewController: uiViewController)
    }
    
    private func animateToSelectedMarker(viewController: MapViewController) {
        
        let position = CLLocationCoordinate2D(latitude: recipe.latitude, longitude: recipe.longitude)
        let map = viewController.map
        let marker = GMSMarker(position: position)
        marker.title = recipe.name
        marker.map = map
        map.animate(with: GMSCameraUpdate.setTarget(position))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        map.animate(toZoom: 14)
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {  
            onAnimationEnded()
          })
        })
      }
}

class CustomMarker: GMSMarker, Identifiable {
    var id = UUID()
}
