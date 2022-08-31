//
//  KitchenRecipesApp.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 25/08/22.
//

import SwiftUI

@main
struct KitchenRecipesApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let mainContainer = MainContainer.sharedContainer.container
    
    var body: some Scene {
        WindowGroup {
            HomeUIView(viewModel: mainContainer.resolve(HomeViewModel.self)!)
        }
    }
}
