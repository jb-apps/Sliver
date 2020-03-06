//
//  SceneDelegate.swift
//  Sliver
//
//  Created by Jonathan Benavides Vallejo on 28/02/2020.
//  Copyright © 2020 Jonathan Benavides Vallejo. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let delegate = SliverChildListDelegate(children: [
            UserTableViewCell.fromNib(),
            ComplexTableViewCell.fromNib(),
            UserTableViewCell.fromNib(),
            ComplexTableViewCell.fromNib()
        ])
        
        delegate.canSelectItem = { index in
            if index % 2 == 0 {
                return true
            } else {
                return false
            }
        }
        
        delegate.didSelectItem = { index in
            print(index)
        }
        
        let sliverListOne = SliverList(delegate: delegate)
        sliverListOne.hidesDefaultSeparator = true
        
        let headerSliver = ButtonViewController {
            print("Did tap button")
        }
        
        let footerSliver = TestViewController()
        footerSliver.view.backgroundColor = .yellow
        footerSliver.testView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let sliverHeaderFooter = SliverHeaderFooter(
            header: headerSliver,
            footer: footerSliver,
            content: sliverListOne,
            spacing: 8.0)
        sliverHeaderFooter.backgroundColor = .systemGray
        
        
        let redTestViewController = TestViewController()
        redTestViewController.view.backgroundColor = .red
        redTestViewController.testView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        let purpleTestViewController = TestViewController()
        purpleTestViewController.view.backgroundColor = .purple
        purpleTestViewController.testView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        let delegateSliver = SliverChildListDelegate(children: [
            UserTableViewCell.fromNib(),
            UserTableViewCell.fromNib(),
            ComplexTableViewCell.fromNib(),
            ComplexTableViewCell.fromNib(),
        ])
        
        let sliverListTwo = SliverList(delegate: delegateSliver)
        
        let customScrollView = CustomScrollView(
            spacing: 16.0,
            slivers: [
                sliverHeaderFooter,
                redTestViewController,
                SliverPadding(insets: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: -32), sliver: sliverListTwo),
                SliverSafeArea(sliver: purpleTestViewController)
        ])
        customScrollView.backgroundColor = .white
        
        window?.rootViewController = customScrollView
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

