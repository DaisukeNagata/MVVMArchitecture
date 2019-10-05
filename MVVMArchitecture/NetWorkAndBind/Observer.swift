//
//  Observer.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/10/05.
//  Copyright © 2019 永田大祐. All rights reserved.
//

protocol Observer {
     func valueSet(_ model: Any)
     func observe<O>(for observable: Observable<O>, with: @escaping (O) -> ())
}
