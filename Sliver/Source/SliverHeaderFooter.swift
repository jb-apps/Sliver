//
//  SliverHeaderFooter.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

public final class SliverHeaderFooter: UIViewController, Sliver {
    
    private let header: Sliver?
    private let footer: Sliver?
    private let content: Sliver
    private let stackView: UIStackView
    private let spacing: CGFloat
    public var backgroundColor: UIColor = .white {
        didSet { view.backgroundColor = backgroundColor }
    }
    
    init(header: Sliver? = nil, footer: Sliver? = nil, content: Sliver, spacing: CGFloat = 0.0) {
        self.header = header
        self.footer = footer
        self.content = content
        self.stackView = UIStackView()
        self.spacing = spacing
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not intended to be used")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setStackView()
        addSubviews()
    }
    
    private func addSubviews() {
        view.autoAddSubview(stackView)
        
        if let header = header {
            header.willMove(toParent: self)
            stackView.addArrangedSubview(header.view)
            header.didMove(toParent: self)
        }
        
        content.willMove(toParent: self)
        stackView.addArrangedSubview(content.view)
        content.didMove(toParent: self)
        
        if let footer = footer {
            footer.willMove(toParent: self)
            stackView.addArrangedSubview(footer.view)
            footer.didMove(toParent: self)
        }
    }
    
    private func setStackView() {
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = spacing
    }
}
