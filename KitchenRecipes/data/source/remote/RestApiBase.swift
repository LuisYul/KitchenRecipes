//
//  RestApiBase.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 28/08/22.
//

import Foundation
import Alamofire

class RestApiBase {
  var request: Alamofire.Request?
  
  let baseUrl = "http://demo9946888.mockable.io/"
    
  func cancelRequest() {
    request?.cancel()
  }
}

