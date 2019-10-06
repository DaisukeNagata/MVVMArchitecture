//
//  Observable.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

final class Observable<ObservedType> {

    typealias Observer = (_ observable: ObservedType) -> Void

    var value: ObservedType? {
        didSet {
            guard value.debugDescription.contains(oldValue.debugDescription) else {
                if let value = value { notifyObservers(value) }
                return
            }
        }
    }

    private var observers: [Observer] = []

    func initProperty() { value = nil }

    func observe(with: @escaping Observer) { bind(observer: with) }

    private func bind(observer: @escaping Observer) { self.observers.append(observer) }

    private func notifyObservers(_ value: ObservedType) { self.observers.forEach { observer in observer(value) } }
}
