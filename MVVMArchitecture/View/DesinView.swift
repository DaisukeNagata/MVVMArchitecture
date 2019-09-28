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
    let labelTwo = UILabel()
    let bt = UIButton()

    private let topHeight: CGFloat = UINavigationController.init().navigationBar.frame.height +
        (UIWindow.init().windowScene?.statusBarManager?.statusBarFrame.height ?? UIApplication.shared.statusBarFrame.height) 

    override init(frame: CGRect) {
        super.init(frame: frame)

        desgin()
        observe()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func desgin() {
        self.frame = UIScreen.main.bounds
        self.addSubview(labelOne)
        self.addSubview(labelTwo)
        self.addSubview(bt)

        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        bt.translatesAutoresizingMaskIntoConstraints = false

        layoutAnchor(labelOne, constrait: self.topAnchor, height: topHeight)
        layoutAnchor(labelTwo, constrait: labelOne.bottomAnchor)
        layoutAnchor(bt, constrait: labelTwo.bottomAnchor)

        labelOne.backgroundColor = .red
        labelTwo.backgroundColor = .blue
        bt.backgroundColor = .yellow
    }

    private func layoutAnchor(_ v: UIView, constrait: NSLayoutYAxisAnchor, height: CGFloat? = nil) {
        v.translatesAutoresizingMaskIntoConstraints = false
        v.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        v.topAnchor.constraint(equalTo    : constrait, constant: height ?? 0).isActive = true
        v.widthAnchor.constraint(equalTo  : self.widthAnchor, multiplier: 1).isActive = true
        v.heightAnchor.constraint(equalTo : self.heightAnchor, multiplier: 0.1).isActive = true
    }

    private func observe() {
        vm.observe(for: vm.model) {
            [weak self ](value) in
            guard let selfStrong = self else { return }
            selfStrong.labelOne.text = value.one
            selfStrong.labelTwo.text = value.two
        }
    }
}
