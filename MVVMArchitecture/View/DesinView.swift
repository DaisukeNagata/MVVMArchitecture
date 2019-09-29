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

        LayoutAnchor().layoutAnchor(labelOne,
                     xAxisAnchor     : self.centerXAnchor,
                     constantY       : self.topAnchor,
                     height          : topHeight,
                     widthmultiplier : 1,
                     heightmultiplier: 0.1,
                     widthAnchor     : self.widthAnchor,
                     heightAnchor    : self.heightAnchor)

        LayoutAnchor().layoutAnchor(labelTwo,
                     xAxisAnchor     : self.centerXAnchor,
                     constantY       : labelOne.bottomAnchor,
                     widthmultiplier : 1,
                     heightmultiplier: 0.1,
                     widthAnchor     : self.widthAnchor,
                     heightAnchor    : self.heightAnchor)

        LayoutAnchor().layoutAnchor(bt,
                     xAxisAnchor     : self.centerXAnchor,
                     constantY       : labelTwo.bottomAnchor,
                     widthmultiplier : 1,
                     heightmultiplier: 0.1,
                     widthAnchor     : self.widthAnchor,
                     heightAnchor    : self.heightAnchor)

        labelOne.backgroundColor = .red
        labelTwo.backgroundColor = .blue
        bt.backgroundColor = .yellow
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
