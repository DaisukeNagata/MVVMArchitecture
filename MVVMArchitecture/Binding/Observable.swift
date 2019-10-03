//
//  Observable.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import Foundation

final class Observable<ObservedType> {

    typealias Observer = (_ observable: Observable<ObservedType>, ObservedType) -> Void

    private var observers: [Observer]

    var value: ObservedType? {
        didSet {
            if let value = value {
                notifyObservers(value)
            }
        }
    }

    init(_ value: ObservedType? = nil) {
        self.value = value
        observers = []
    }

    func bind(observer: @escaping Observer) { self.observers.append(observer) }

    func notifyObservers(_ value: ObservedType) {
        self.observers.forEach { [unowned self](observer) in
            observer(self, value)
        }
    }
}