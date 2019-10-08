//
//  Observable.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//
import Foundation

final class Observable<ObservedType> {

    typealias Observer = (_ observable: ObservedType) -> Void

    var value: ObservedType? {
        didSet {
            if let value = value { notifyObservers(value) }
        }
    }

    private var observers: [Observer] = []

    func bind(observer: @escaping Observer) { self.observers.append(observer) }

    private func notifyObservers(_ value: ObservedType) { self.observers.forEach { observer in observer(value) } }
}
