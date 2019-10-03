//
//  APIModel.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/10/01.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import Foundation

class APIModel: NetWorkAndBind {

    func networkIsReady<M>(_ url: URL,completion: @escaping (_ model: M?) -> Void) {
           // example view set
           request(from: url, { (_ result: Result<M, Error>) in
               switch result {
               case .success(let s):
                   completion(s)
               case.failure(let f):
                   print(f)
               }
           })
       }

       func request<J>(from url: URL, _ completion: @escaping (Result<J, Error>) -> Void) {
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
