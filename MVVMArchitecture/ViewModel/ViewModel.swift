//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class ViewModel {

    var api: APIModel? = nil

    init() {
         api = APIModel()
    }

    func conect() {
        api?.networkIsReady()
    }

    func observe<T>(for observable: Observable<T>, with: @escaping (T) -> ()) {
        observable.bind { observable, value  in
            DispatchQueue.main.async {
                // let o = observable as? Observable<Model>
                // print(o?.value?.one)
                // print(o?.value?.two)
                with(value)
            }
        }
    }
}
