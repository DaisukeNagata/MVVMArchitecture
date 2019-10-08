//
//  APIConnect.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/10/09.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import Foundation

protocol APIConnect {
    func conect(_ url: URL)
    func valueSet(_ model: Any)
}
