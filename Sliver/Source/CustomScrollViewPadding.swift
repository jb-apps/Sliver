//
//  CustomScrollViewPadding.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

final class CustomScrollViewPadding: UIViewController {

    private let insets: UIEdgeInsets
    private let customScrollView: CustomScrollView
    
    public var backgroundColor: UIColor = .white
    
    init(insets: UIEdgeInsets, customScrollView: CustomScrollView) {
        self.insets = insets
        self.customScrollView = customScrollView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not intended to be used")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        customScrollView.willMove(toParent: self)
        view.autoAddSubview(customScrollView.view, insets: insets)
        customScrollView.didMove(toParent: self)
    }

}
