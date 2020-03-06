//
//  ButtonViewController.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController, Sliver {
    
    public var backgroundColor: UIColor = .white
    private let onTap: () -> Void
    
    init(onTap: @escaping () -> Void) {
        self.onTap = onTap
        super.init(nibName: "ButtonViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        onTap()
    }
}
