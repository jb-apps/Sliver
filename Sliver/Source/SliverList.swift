//
//  SliverList.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 28/02/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

final class NonScrollableUITableView: UITableView {
    
    override var contentSize: CGSize {
        didSet { invalidateIntrinsicContentSize() }
    }

    override var intrinsicContentSize: CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not intended to be used")
    }
}

final class SliverChildListDelegate: NSObject {
    
    var children: [UITableViewCell]
    var canSelectItem: ((Int) -> Bool)?
    var didSelectItem: ((Int) -> ())?
    
    init(children: [UITableViewCell]) {
        self.children = children
    }
}

extension SliverChildListDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let canSelectItem = canSelectItem else { return false }
        return canSelectItem(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SliverChildListDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        children.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        children[indexPath.row]
    }
}

public final class SliverList: UIViewController, Sliver {
    
    let tableView: NonScrollableUITableView
    private let delegate: SliverChildListDelegate
    public var backgroundColor: UIColor = .white {
        didSet { view.backgroundColor = backgroundColor }
    }
    var hidesDefaultSeparator: Bool = false {
        didSet {
            if hidesDefaultSeparator {
                tableView.separatorStyle = .none
            } else {
                tableView.separatorStyle = .singleLine
            }
        }
    }
    
    
    init(delegate: SliverChildListDelegate) {
        tableView = NonScrollableUITableView(frame: .zero, style: .plain)
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        tableView.delegate = delegate
        tableView.dataSource = delegate
        addSubviews()
    }
    
    private func addSubviews() {
        view.autoAddSubview(tableView)
    }
}
