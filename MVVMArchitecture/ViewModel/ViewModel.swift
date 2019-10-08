//
//  ViewModel.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import Foundation

class ViewModel: Observer, APIConnect {

    var api            : APIModel? = nil
    var model          : Observable<Model>?
    var modelPrimitive : Observable<ModelPrimitive>?

    init() {
        api = APIModel()
        model = Observable()
        modelPrimitive = Observable()
    }

    func conect(_ url: URL) { api?.networkIsReady(url, completion: valueSet) }

    func valueSet(_ model: Any) { self.model?.value = model as? Model }
    
    func titleSet(_ model: ModelPrimitive) { self.modelPrimitive?.value = model }

    func observe<O>(for observable: Observable<O>, with: @escaping (O) -> Void) { observable.bind(observer: with) }
}
