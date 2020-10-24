//
//  SettingsTableViewController.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 21/10/20.
//

import UIKit
import LocalAuthentication

class SettingsView: UITableViewController {

    @IBOutlet var tblMain: UITableView!
    @IBOutlet weak var swtBiometricID: UISwitch!
    @IBOutlet weak var swtModeDark: UISwitch!
    
    var biometricIDCOnfigured: Bool = false
    var isDarkMode: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        isDarkMode = traitCollection.userInterfaceStyle == .dark
        swtBiometricID.setOn(biometricIDCOnfigured, animated: true)
        // navigationController?.navigationBar.backgroundColor = isDarkMode ? .systemBackground : .secondarySystemBackground
        if let indexPath = tblMain.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        title = "Configuración"
    }
    
    @IBAction func actionSwtBiometricID(_ sender: UISwitch) {
        let switchStatus: Bool = sender.isOn
        
        if (switchStatus) {
            configureBiometricID()
        } else {
            setStateBiometricID(state: false)
        }
    }
    
    @IBAction func actionSwtDarkMode(_ sender: UISwitch) {
        let switchStatus: Bool = sender.isOn
        
        guard let appDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
           return
        }
        
        if (switchStatus) {
            appDelegate.changeTheme(themeVal: "dark")
            navigationController?.navigationBar.backgroundColor = .systemBackground
        } else {
            appDelegate.changeTheme(themeVal: "light")
        }
    }
    
    fileprivate func setStateBiometricID(state: Bool) {
        biometricIDCOnfigured = state
        swtBiometricID.setOn(state, animated: true)
        UserDefaults.standard.set(state, forKey: KEY_HAS_BIOMETRIC_ID)
    }
    
    fileprivate func disableBiometricID() {
        
    }
    
    fileprivate func configureBiometricID() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        let ac = UIAlertController(title: "Authentication Sucess", message: "Thanks", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self!.present(ac, animated: true)
                        self!.setStateBiometricID(state: true)
                        
                    } else {
                        self!.setStateBiometricID(state: false)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
            self.setStateBiometricID(state: false)
        }
        
    }
}
