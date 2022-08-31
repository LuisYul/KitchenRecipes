//
//  GetKitchenRecipesUseCase.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 29/08/22.
//


import RxSwift

final class GetKitchenRecipesUseCase {
        
    private var kitchenRecipesRepository: KitchenRecipesRepository
    
    init(kitchenRecipesRepository: KitchenRecipesRepository) {
        self.kitchenRecipesRepository = kitchenRecipesRepository
    }
    
    func call() -> Observable<[KitchenRecipeEntity]> {
        kitchenRecipesRepository.getRecipes()
    }
    
}
