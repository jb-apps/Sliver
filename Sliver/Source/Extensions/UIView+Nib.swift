//
//  UIView+Nib.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

public extension UIView {
    class func fromNib() -> Self {
        func fromNib<T: UIView>() -> T {
            let bundle = Bundle(for: T.self)
            let nibs = UINib(nibName: "\(self)", bundle: bundle).instantiate(withOwner: nil, options: nil)
            let nib = nibs.first as! T
            
            return nib
        }
        
        return fromNib()
    }
}

