//
//  TestViewController.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, Sliver {
    
    let testView = UIView()
    public var backgroundColor: UIColor = .white {
        didSet { view.backgroundColor = backgroundColor }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.autoAddSubview(testView)
    }
}
