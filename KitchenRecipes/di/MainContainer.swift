//
//  MainContainer.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 30/08/22.
//

import Foundation
import Swinject

class MainContainer {
    
    static let sharedContainer = MainContainer()
    let container = Container()
    
    private init() {
        setupDefaultContainers()
    }
    
    private func setupDefaultContainers() {
        
        container.register(AppServiceClient.self) { _ in AppServiceClient.init() }
        
        container.register(KitchenRecipesRepository.self) { resolver in
            let kitchenRecipesRepository = KitchenRecipesRepositoryImpl(appServiceClient: resolver.resolve(AppServiceClient.self)!)
            return kitchenRecipesRepository
        }
        
        container.register(GetKitchenRecipesUseCase.self) { resolver in
            GetKitchenRecipesUseCase(kitchenRecipesRepository:resolver.resolve(KitchenRecipesRepository.self)!)
        }
        
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(getKitchenRecipesUseCase: resolver.resolve(GetKitchenRecipesUseCase.self)!)
        }
    }
    
}
