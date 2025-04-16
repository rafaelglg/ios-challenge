//
//  SceneDelegate.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 16/4/25.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewController = Dependencies.createIdealistaViewController()
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        self.window = window
    }
}
