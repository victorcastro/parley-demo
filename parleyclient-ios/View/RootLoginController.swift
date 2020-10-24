//
//  RootLoginController.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 15/10/20.
//

import UIKit

class RootLoginController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.viewControllers = [LoginView()]
    }
   
}
