//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import Foundation

class ViewModel: Observer {

    var api            : APIModel? = nil
    var model          = Observable()
    var modelPrimitive = Observable()

    init() {
        api = APIModel()

    }

    func conect(_ url: URL) { api?.networkIsReady(url, completion: valueSet) }

    func valueSet(_ model: ModelPrimitive) { self.modelPrimitive.value = model }

    func observe(for observable: Observable, with: @escaping (ModelPrimitive) -> Void) {
        observable.bind(observer: with)
    }
}
