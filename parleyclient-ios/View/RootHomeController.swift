//
//  RootTabBarController.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 10/10/20.
//

import UIKit
import FontAwesome_swift

class RootHomeController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let mainView = UIStoryboard(name: "SettingsView", bundle: nil)
        let settingsView : UIViewController = mainView.instantiateViewController(identifier: "SettingsTableStaticView") as SettingsView
        
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.isTranslucent = false
        viewControllers = [
            createTabBarItem(tabBarTitle: "Anuncios", tabBarImage: .bullhorn, viewController: AnnouncesView()),
//            createTabBarItem(tabBarTitle: "Encuentas", tabBarImage: .questionCircle, viewController: SettingsView())
//            createTabBarItem(tabBarTitle: "Reservas", tabBarImage: .calendarAlt, viewController: SettingsView()),
            createTabBarItem(tabBarTitle: "Configuración", tabBarImage: .cog, viewController: settingsView),
        ]
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: FontAwesome, viewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = tabBarTitle
        navController.tabBarItem.image = UIImage.fontAwesomeIcon(name: tabBarImage, style: .solid, textColor: .black, size: CGSize(width: 30, height: 30))
        navController.isNavigationBarHidden = true
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.backgroundColor = .systemBackground
        navController.navigationBar.tintColor = .systemBlue
        navController.navigationBar.barTintColor = .systemBackground
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.layoutIfNeeded()
        navController.hidesBarsOnSwipe = true
        return navController
    }
}
