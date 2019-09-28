//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

protocol Observer {
      func observe<T>(for observable: Observable<T>, with: @escaping (T) -> ())
}

final class ViewModel: Observer {

    var model : Observable<Model> = Observable()
    
    func observe<T>(for observable: Observable<T>, with: @escaping (T) -> ()) {
        observable.bind { observable, value  in
            DispatchQueue.main.async {
                with(value)
            }
        }
    }

    func networkIsReady() {
        // example view set
        request(from: URLComponent.exampleUrl, { (_ result: Result<Model, Error>) in
            switch result {
            case .success(let s):
                self.valueSet(s)
             print(s)
                break
            case.failure(let f):
                print(f)
            }
        })
    }

    private func valueSet(_ model: Model) {
        // decord or init
        self.model.value = model
    }
    
    private func request<J>(from url: URL, _ completion: @escaping (Result<J, Error>) -> Void) {
        ApiClient.request(url: url, httpMethod: "GET", completion:{ data, res, error in
            do{
                if let data = data {
                    let decoder: JSONDecoder = JSONDecoder()
                    guard let newJson = try decoder.decode(Model.self, from: data) as? J else { return }
                    completion(.success(newJson))
                }
            } catch{
                print("Serialize Error.")
            }
        })
    }
}
