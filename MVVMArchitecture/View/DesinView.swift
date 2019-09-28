//
//  DesinView.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class DesinView: UIView {

    let vm = ViewModel()
    let labelOne = UILabel()
    let imageOne = UIImageView()
    let labelTwo = UILabel()
    let imageTwo = UIImageView()
    let bt = UIButton()

    private let topHeight: CGFloat = UINavigationController.init().navigationBar.frame.height +
    (UIWindow.init().windowScene?.statusBarManager?.statusBarFrame.height ?? UIApplication.shared.statusBarFrame.height)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

         desgin()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func desgin() {
        self.frame = UIScreen.main.bounds

        self.addSubview(labelOne)
        self.addSubview(imageOne)
        self.addSubview(labelTwo)
        self.addSubview(imageTwo)
        self.addSubview(bt)
        
        layoutAnchor(labelOne, xAxisAnchor: self.centerXAnchor, constantY: self.topAnchor, widthmultiplier: 1, heightmultiplier: 0.1, height: topHeight)
        layoutAnchor(imageOne, xAxisAnchor: labelOne.centerXAnchor, constantX: self.frame.width/2 - self.frame.width/9.96, constantY: self.topAnchor, widthmultiplier: 0.2, heightmultiplier: 0.1, height: topHeight)

        layoutAnchor(labelTwo, xAxisAnchor: self.centerXAnchor, constantY: labelOne.bottomAnchor, widthmultiplier: 1, heightmultiplier: 0.1)
        layoutAnchor(imageTwo, xAxisAnchor: imageOne.centerXAnchor, constantY: labelOne.bottomAnchor, widthmultiplier: 0.2, heightmultiplier: 0.1)

        layoutAnchor(bt, xAxisAnchor: self.centerXAnchor, constantY: labelTwo.bottomAnchor, widthmultiplier: 1, heightmultiplier: 0.1)

        labelOne.backgroundColor = .red
        labelTwo.backgroundColor = .blue
        bt.backgroundColor = .yellow
    }

    private func layoutAnchor(_ v             : UIView,
                              xAxisAnchor     : NSLayoutXAxisAnchor,
                              constantX       : CGFloat? = nil,
                              constantY       : NSLayoutYAxisAnchor,
                              widthmultiplier : CGFloat? = nil,
                              heightmultiplier: CGFloat? = nil,
                              height          : CGFloat? = nil) {
             v.translatesAutoresizingMaskIntoConstraints = false
             v.centerXAnchor.constraint(equalTo: xAxisAnchor, constant: constantX ?? 0).isActive = true
             v.topAnchor.constraint(equalTo    : constantY, constant: height ?? 0).isActive = true
             v.widthAnchor.constraint(equalTo  : self.widthAnchor, multiplier: widthmultiplier ?? 0).isActive = true
             v.heightAnchor.constraint(equalTo : self.heightAnchor, multiplier: heightmultiplier ?? 0).isActive = true
         }
}
