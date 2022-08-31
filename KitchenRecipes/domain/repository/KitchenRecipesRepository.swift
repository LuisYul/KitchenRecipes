//
//  KitchenRecipesRepository.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 29/08/22.
//

import Foundation
import RxSwift

protocol KitchenRecipesRepository {
    
    func getRecipes() -> Observable<[KitchenRecipeEntity]>
    
}
