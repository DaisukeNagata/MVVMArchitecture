//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class ViewModel {

    var api   : APIModel? = nil
    var model : Observable<Model>?

    init() {
        model = Observable()
        api = APIModel()
    }

    func conect() { api?.networkIsReady(completion: valueSet(_:)) }

    func valueSet(_ model: Model?) { self.model?.value = model } 

    func observe<O>(for observable: Observable<O>, with: @escaping (O) -> ()) {
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
