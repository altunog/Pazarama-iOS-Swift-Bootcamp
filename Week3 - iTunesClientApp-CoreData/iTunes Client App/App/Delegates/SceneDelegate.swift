//
//  SceneDelegate.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupWindow(with: windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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


    private func setupWindow(with windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let tabBarController = UITabBarController()
        let viewControllers = [
            createPodcastViewController(),
           createMusicViewController(),
           createMovieViewController(),
           createSoftwareViewController(),
           createEbookViewController(),
           createFavoritesViewController()
        ]
        for vc in viewControllers {
            vc.navigationBar.prefersLargeTitles = true
            vc.navigationBar.tintColor = .systemPink
        }
        tabBarController.viewControllers = viewControllers
        tabBarController.tabBar.tintColor = .systemPink
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func createPodcastViewController() -> UINavigationController {
        let podcastVC = PodcastVC()
        podcastVC.title = "Podcasts"
        podcastVC.tabBarItem = UITabBarItem(title: "Podcasts", image: UIImage(systemName: "mic"), tag: 0)
        
        return UINavigationController(rootViewController: podcastVC)
    }
    
    func createMusicViewController() -> UINavigationController {
        let musicVC = MusicVC()
        musicVC.title = "Musics"
        musicVC.tabBarItem = UITabBarItem(title: "Musics", image: UIImage(systemName: "music.quarternote.3"), tag: 1)
        
        return UINavigationController(rootViewController: musicVC)
    }
    
    func createMovieViewController() -> UINavigationController {
        let movieVC = MovieVC()
        movieVC.title = "Movies"
        movieVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), tag: 2)
        
        return UINavigationController(rootViewController: movieVC)
    }
    
    func createSoftwareViewController() -> UINavigationController {
        let softwareVC = SoftwareVC()
        softwareVC.title = "Softwares"
        softwareVC.tabBarItem = UITabBarItem(title: "Softwares", image: UIImage(systemName: "laptopcomputer.and.iphone"), tag: 3)
        
        return UINavigationController(rootViewController: softwareVC)
    }
    
    func createEbookViewController() -> UINavigationController {
        let eBookVC = EBookVC()
        eBookVC.title = "eBooks"
        eBookVC.tabBarItem = UITabBarItem(title: "eBooks", image: UIImage(systemName: "book"), tag: 4)
        
        return UINavigationController(rootViewController: eBookVC)
    }
    
    func createFavoritesViewController() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 5)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
}

