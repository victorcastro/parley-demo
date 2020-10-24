//
//  LoginVIew.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 10/10/20.
//w

import UIKit
import LocalAuthentication

class LoginView: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var btnBiometricID: UIButton!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    let defaults = UserDefaults.standard
    var sessionIsLogged: Bool?
    var sessionHasBiometricID: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setup()
    }
    
    fileprivate func setup() {
        btnSubmit.layer.cornerRadius = 15
        
        let isBiometricIDConfigured = defaults.object(forKey: KEY_HAS_BIOMETRIC_ID) as? Bool ?? false
        btnBiometricID.isHidden = !isBiometricIDConfigured
        
        if (isBiometricIDConfigured) {
            validateBiometricID()
        }
        
    }

    @IBAction func startLogin(_ sender: Any) {
        navigationController?.pushViewController(UsernameLoginView(), animated: true)
    }
    
    @IBAction func logoutSession(_ sender: Any) {
        UserDefaults.standard.setValue(nil, forKey: KEY_IS_LOGGED)
        UserDefaults.standard.setValue(nil, forKey: KEY_HAS_BIOMETRIC_ID)
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(LoginView())
    }
    
    @IBAction func loginWithBiometricID(_ sender: UIButton) {
        validateBiometricID()
    }
    
    fileprivate func validateBiometricID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        UserDefaults.standard.setValue(true, forKey: KEY_HAS_BIOMETRIC_ID)
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(RootHomeController())
                    }
                }
            }
        }
    }
}
