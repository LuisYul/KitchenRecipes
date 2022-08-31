//
//  HomeViewModel.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 30/08/22.
//

import Foundation
import RxSwift

final class HomeViewModel: ObservableObject {
        
    private var getKitchenRecipesUseCase: GetKitchenRecipesUseCase
    
    init(getKitchenRecipesUseCase: GetKitchenRecipesUseCase) {
        self.getKitchenRecipesUseCase = getKitchenRecipesUseCase
        getRecipes()
    }
    
    @Published var kitchenRecipes = [KitchenRecipeEntity]()
    
    private let disposeBag: DisposeBag = DisposeBag()
        
    func getRecipes() {
        getKitchenRecipesUseCase.call()
            .subscribe(onNext: {
                self.kitchenRecipes = $0
            }, onError: {
                print($0.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}

