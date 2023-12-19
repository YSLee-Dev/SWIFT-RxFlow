//
//  SceneDelegate.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/17/23.
//

import UIKit

import RxFlow

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        self.coordinator.coordinate(flow: AppFlow(window: self.window!), with: AppStepper())
        self.window?.makeKeyAndVisible()
    }
}

