//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

class ViewModel {

    var api            : APIModel? = nil
    var model          : Observable<Model>?
    var modelPrimitive : Observable<ModelPrimitive>?

    init() {
        api = APIModel()
        model = Observable()
        modelPrimitive = Observable()
    }

    func conect(_ url: URL) { api?.networkIsReady(url, completion: valueSet(_:)) }

    func valueSet(_ model: Model?) { self.model?.value = model } 

    func observe<O>(for observable: Observable<O>, with: @escaping (O) -> ()) {
        observable.bind { value in with(value) }
    }
}
