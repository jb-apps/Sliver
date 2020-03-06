//
//  SliverBox.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

public final class SliverBox: UIViewController, Sliver {
    
    private let content: UIView
    public var backgroundColor: UIColor = .white {
        didSet { view.backgroundColor = backgroundColor }
    }
    
    init(content: UIView) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not intended to be used")
    }
    
    public override func loadView() {
        super.loadView()
        self.view = content
    }
}
