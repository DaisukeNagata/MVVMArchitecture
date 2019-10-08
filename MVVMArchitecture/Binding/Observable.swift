//
//  Observable.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

final class Observable {

    var value: ModelPrimitive? {
        didSet {
            guard value.debugDescription.contains(oldValue.debugDescription) else {
                if let value = value { notifyObservers(value) }
                return
            }
        }
    }

//    private var observers: ((String) -> Void)
    var observers = {(_: ModelPrimitive) -> Void in }
    
    func bind(observer: @escaping (ModelPrimitive) -> Void) {
        self.observers = observer
    }

    private func notifyObservers(_ value: ModelPrimitive) {
        observers(value)
    }
}
