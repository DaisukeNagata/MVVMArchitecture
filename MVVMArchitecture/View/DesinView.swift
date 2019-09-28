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
        self.addSubview(labelTwo)
        self.addSubview(bt)

        labelOne.frame = CGRect(x: 0, y: 100, width: self.frame.width, height: 100)
        labelTwo.frame = CGRect(x: 0, y: 200, width: self.frame.width, height: 100)
        bt.frame = CGRect(x: 0, y: 300, width: self.frame.width, height: 100)

        labelOne.backgroundColor = .red
        labelTwo.backgroundColor = .blue
        bt.backgroundColor = .yellow
    }
}
