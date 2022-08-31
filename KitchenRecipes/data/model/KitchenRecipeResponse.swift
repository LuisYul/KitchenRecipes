//
//  KitchenRecipeResponse.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 28/08/22.
//

import Foundation
import ObjectMapper

final class KitchenRecipeResponse: Decodable {
    var id: Int!
    var name: String!
    var ingredients: String!
    var description: String!
    var image: String!
    var latitude: Double!
    var longitude: Double!
  
    required init?(map: Map) {
    }
  
    func mapToEntity() -> KitchenRecipeEntity {
        return KitchenRecipeEntity(
            id: id,
            name: name,
            ingredients: ingredients,
            description: description,
            image: image,
            latitude: latitude,
            longitude: longitude
        )
    }
}
