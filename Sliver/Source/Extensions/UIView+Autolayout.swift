//
//  UIView+Autolayout.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 01/03/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

extension UIView {
    
    func autoAddSubview(_ subview: UIView, insets: UIEdgeInsets = .zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subview)
        
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom),
            subview.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left),
            subview.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right)
        ])
    }
    
    func autoAddSubviewSafeArea(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subview)
        
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: safeTopAnchor),
            subview.bottomAnchor.constraint(equalTo: safeBottomAnchor),
            subview.leftAnchor.constraint(equalTo: safeLeftAnchor),
            subview.rightAnchor.constraint(equalTo: safeRightAnchor)
        ])
    }
    
    private var safeTopAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return safeAreaLayoutGuide.topAnchor
      }
      return topAnchor
    }

    private var safeLeftAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return safeAreaLayoutGuide.leftAnchor
      }
      return leftAnchor
    }

    private var safeRightAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return safeAreaLayoutGuide.rightAnchor
      }
      return rightAnchor
    }

    private var safeBottomAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return safeAreaLayoutGuide.bottomAnchor
      }
      return bottomAnchor
    }
}
