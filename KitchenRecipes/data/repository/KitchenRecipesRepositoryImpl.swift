//
//  KitchenRecipesRepositoryImpl.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 28/08/22.
//

import Foundation
import RxSwift

class KitchenRecipesRepositoryImpl: KitchenRecipesRepository {
        
    private var appServiceClient: AppServiceClient
    
    init(appServiceClient: AppServiceClient) {
        self.appServiceClient = appServiceClient
    }
    
    func getRecipes() -> Observable<[KitchenRecipeEntity]> {
        return appServiceClient.getRecipes().map{ response in
            return response.map{ $0.mapToEntity() }
        }
    }
    
}
