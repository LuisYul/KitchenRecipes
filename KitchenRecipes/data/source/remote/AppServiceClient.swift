//
//  AppServiceClient.swift
//  KitchenRecipes
//
//  Created by Luis Baltodano on 28/08/22.
//

import RxSwift
import Alamofire

final class AppServiceClient: RestApiBase {

    func getRecipes() -> Observable<[KitchenRecipeResponse]> {
      let finalUrl = baseUrl + "kitchen-recipes"
      return Observable<[KitchenRecipeResponse]>.create({ observer -> Disposable in
        self.request = AF.request(finalUrl)
          .validate()
          .responseDecodable(completionHandler: { (response: AFDataResponse<[KitchenRecipeResponse]>) in
          switch response.result {
          case .success(let data):
            observer.onNext(data)
            observer.onCompleted()
          case .failure(let error):
            observer.onError(error)
          }
        })
        return Disposables.create(with: {
          self.request?.cancel()
        })
      })
    }
    
}
