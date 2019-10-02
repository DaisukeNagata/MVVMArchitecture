//
//  LayoutAnchor.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/09/30.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class LayoutAnchor {
    func layoutAnchor(_ v                : UIView,
                         xAnchor         : NSLayoutXAxisAnchor,
                         constantX       : CGFloat? = nil,
                         yAnchor         : NSLayoutYAxisAnchor,
                         constantY       : CGFloat? = nil,
                         widthmultiplier : CGFloat? = nil,
                         heightmultiplier: CGFloat? = nil,
                         widthAnchor     : NSLayoutDimension,
                         heightAnchor    : NSLayoutDimension) {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.centerXAnchor.constraint(equalTo: xAnchor, constant: constantX ?? 0).isActive = true
        v.topAnchor.constraint(equalTo    : yAnchor, constant: constantY ?? 0).isActive = true
        v.widthAnchor.constraint(equalTo  : widthAnchor, multiplier: widthmultiplier ?? 0).isActive = true
        v.heightAnchor.constraint(equalTo : heightAnchor, multiplier: heightmultiplier ?? 0).isActive = true
    }
}
