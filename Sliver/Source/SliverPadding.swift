//
//  SliverPadding.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

public final class SliverPadding: UIViewController, Sliver {
    
    private let insets: UIEdgeInsets
    private let sliver: Sliver
    
    public var backgroundColor: UIColor = .white
    
    init(insets: UIEdgeInsets, sliver: Sliver) {
        self.insets = insets
        self.sliver = sliver
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not intended to be used")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        sliver.willMove(toParent: self)
        view.autoAddSubview(sliver.view, insets: insets)
        sliver.didMove(toParent: self)
    }
}
