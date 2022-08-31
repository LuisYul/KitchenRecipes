//
//  MapUIView.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 31/08/22.
//

import SwiftUI

struct MapUIView: View {
    var recipe: KitchenRecipeEntity
   
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
              // Map
              MapViewControllerBridge(recipe: recipe, onAnimationEnded: {
                  //self.zoomInCenter = true
              })
            }
        }
    }
}


