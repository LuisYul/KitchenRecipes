//
//  DetailUIView.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 30/08/22.
//

import SwiftUI

struct DetailUIView: View {
    var recipe: KitchenRecipeEntity
    @State var selection: Int? = nil
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image), scale: 2) { image in
                image
                  .resizable()
                  .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
                .frame(width: 320, height: 320)
            Text(recipe.description)
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
            Text("Ingredientes:")
                .font(.headline)
                .foregroundColor(.black)
            Text(recipe.ingredients)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            NavigationLink(destination: MapUIView(recipe: recipe), tag: 1, selection: $selection) {
                Button {
                    self.selection = 1
                } label: {
                    Label("Ver Origen", systemImage: "map")
                }
            }
            Spacer()
        }.navigationBarTitle(Text(recipe.name), displayMode: .inline)
    }
}


