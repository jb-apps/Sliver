//
//  CustomScrollView.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

public final class CustomScrollView: UIViewController {
    
    // MARK: - Properties
    private let scrollView: UIScrollView
    private let stackView: UIStackView
    private let slivers: [Sliver]
    private let spacing: CGFloat
    public var backgroundColor: UIColor = .white
    
    init(slivers: [Sliver], scrollView: UIScrollView, stackView: UIStackView, spacing: CGFloat) {
        self.slivers = slivers
        self.scrollView = scrollView
        self.stackView = stackView
        self.spacing = spacing
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not intended to be used")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupStackView()
        addSubviews()
        constraintSubviews()
        insertSlivers()
        
        view.backgroundColor = backgroundColor
    }
}


// MARK: - Build

private extension CustomScrollView {
    
    func setupScrollView() {
        scrollView.alwaysBounceVertical = true
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = spacing
    }
    
    func addSubviews() {
        view.autoAddSubview(scrollView)
        scrollView.autoAddSubview(stackView)
    }
    
    func constraintSubviews() {
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func insertSlivers() {
        slivers.forEach(append(sliver:))
    }
}


// MARK: - Public methods

public extension CustomScrollView {
    func insert(sliver: Sliver, at position: Position) {
        sliver.willMove(toParent: self)
        addChild(sliver)
        
        switch position {
        case .start:
            let subviews = stackView.arrangedSubviews
            stackView.removeArrangedSubviews()
            stackView.addArrangedSubviews([sliver.view] + subviews)
        case .end:
            stackView.addArrangedSubview(sliver.view)
        case .index(let index):
            var subviews = stackView.arrangedSubviews
            stackView.removeArrangedSubviews()
            subviews.insert(sliver.view, at: index)
            stackView.addArrangedSubviews(subviews)
        }
        
        sliver.didMove(toParent: self)
    }
    
    func append(sliver: Sliver) {
        insert(sliver: sliver, at: .end)
    }
}


// MARK: - Position

public extension CustomScrollView {
    enum Position {
        case start
        case end
        case index(Int)
    }
}

private extension UIStackView {
    func removeArrangedSubviews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    func addArrangedSubviews(_ arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach(addArrangedSubview(_:))
    }
}

public extension CustomScrollView {
    convenience init(slivers: [Sliver]) {
        self.init(slivers: slivers, scrollView: UIScrollView(), stackView: UIStackView(), spacing: 0.0)
    }
    
    convenience init(spacing: CGFloat, slivers: [Sliver]) {
        self.init(slivers: slivers, scrollView: UIScrollView(), stackView: UIStackView(), spacing: spacing)
    }
}
