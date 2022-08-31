//
//  KitchenRecipeEntity.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 28/08/22.
//

import Foundation

struct KitchenRecipeEntity: Identifiable {
    
    var id: Int?
    var name: String
    var ingredients: String
    var description: String
    var image: String
    var latitude: Double
    var longitude: Double
    
}
