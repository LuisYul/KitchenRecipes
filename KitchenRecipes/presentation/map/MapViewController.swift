//
//  MapViewController.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 31/08/22.
//

import GoogleMaps
import SwiftUI
import UIKit

class MapViewController: UIViewController {

  let map =  GMSMapView(frame: .zero)
  var isAnimating: Bool = false

  override func loadView() {
    super.loadView()
    map.accessibilityElementsHidden = false
    map.accessibilityIdentifier = "GMSMapView"
    self.view = map
      
  }
}

