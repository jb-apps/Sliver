//
//  SliverSafeArea.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

public final class SliverSafeArea: UIViewController, Sliver {
    
    private let sliver: Sliver
    public var backgroundColor: UIColor = .white
    
    init(sliver: Sliver) {
        self.sliver = sliver
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        sliver.willMove(toParent: self)
        view.autoAddSubviewSafeArea(sliver.view)
        sliver.didMove(toParent: self)
    }
}
