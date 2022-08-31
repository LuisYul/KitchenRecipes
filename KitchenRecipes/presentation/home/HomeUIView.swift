//
//  ContentView.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 25/08/22.
//

import SwiftUI

struct HomeUIView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State private var searchText = ""
    @State private var showDetailView = false
    @State private var selected = KitchenRecipeEntity(name: "", ingredients: "", description: "",
                                                      image: "", latitude: 0.0, longitude: 0.0)
    
    var body: some View {
        NavigationView {
            
            List(searchResults) { recipe in
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: recipe.image), scale: 2) { image in
                        image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 80)
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                        .font(.title3)
                        Text("Ingredientes:")
                            .font(.headline)
                        Text(recipe.ingredients)
                        .font(.subheadline)
                    }
                    Spacer()
                  }
                .onTapGesture {
                    showDetailView = true
                    selected = recipe
                }
            }
            .background(
                NavigationLink("", destination: DetailUIView(recipe: selected), isActive: $showDetailView)
            )
            .searchable(text: $searchText)
            .navigationTitle("Recetas")
        }
        
    }
    
    var searchResults: [KitchenRecipeEntity] {
            if searchText.isEmpty {
                return viewModel.kitchenRecipes
            } else {
                return viewModel.kitchenRecipes.filter {
                    $0.name.lowercased().contains(searchText.lowercased()) ||
                    $0.ingredients.lowercased().contains(searchText.lowercased())
                }
            }
        }
}

