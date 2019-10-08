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
    var valueData      : Data?
    var oldData        : Data?
    init() {
        api = APIModel()
        model = Observable()
        modelPrimitive = Observable()
    }

    func conect(_ url: URL) { api?.networkIsReady(url, completion: valueSet) }

    func valueSet(_ model: Any) { self.model?.value = model as? Model }
    
    func titleSet(_ model: ModelPrimitive) {
        valueData = (model as AnyObject).debugDescription.data(using: .utf8)
        guard valueData == oldData else {
            oldData = valueData
            self.modelPrimitive?.value = model
            return
        }
    }

    func observe<O>(for observable: Observable<O>, with: @escaping (O) -> Void) { observable.bind(observer: with) }
}
