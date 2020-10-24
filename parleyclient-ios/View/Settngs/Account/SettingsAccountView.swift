//
//  SettingsAccountView.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 22/10/20.
//

import UIKit

enum DocTypeID: String {
    case DNI = "DNI"
    case CE = "CE"
    case PASSPORT = "PP"
    case RUC = "RUC"
}

enum SexType: String {
    case MALE = "M"
    case FEMALE = "F"
    case NOT = "N"
}

class SettingsAccountView: UITableViewController {

    @IBOutlet weak var inputNames: UITextField!
    @IBOutlet weak var inputLastnames: UITextField!
    @IBOutlet weak var inputDocNumber: UITextField!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnDocType: UIButton!
    @IBOutlet weak var btnSex: UIButton!
    @IBOutlet weak var btnBrithday: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        inputNames.delegate = self
        inputLastnames.delegate = self
        inputDocNumber.delegate = self
        
        inputNames.returnKeyType = .done
        inputLastnames.returnKeyType = .done
        inputDocNumber.returnKeyType = .done
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func actionBtnLogout(_ sender: UIButton) {
        let alert = UIAlertController(title: "¿Está seguro que desea salir?", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: { (action) in
            UserDefaults.standard.set(nil, forKey: KEY_IS_LOGGED)
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(UINavigationController(rootViewController: LoginView()))
        }))
        
        alert.addAction(UIAlertAction(title: "Cerrar Sesión", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    @IBAction func actionBtnDocType(_ sender: UIButton) {
        let alert = UIAlertController(title: "Seleccione el tipo de documento", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "DNI", style: .default, handler: { (action) in
            print("DNI Selected to Update")
            self.updateDocumentType(type: .DNI)
        }))
        
        alert.addAction(UIAlertAction(title: "Carnet de Extegería", style: .default, handler: { (action) in
            print("CE Selected to Update")
            self.updateDocumentType(type: .CE)
        }))
        
        alert.addAction(UIAlertAction(title: "Pasaporte", style: .default, handler: { (action) in
            print("PP Selected to Update")
            self.updateDocumentType(type: .PASSPORT)
        }))
        
        alert.addAction(UIAlertAction(title: "RUC", style: .default, handler: { (action) in
            print("RUC Selected to Update")
            self.updateDocumentType(type: .RUC)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    @IBAction func actionBtnSex(_ sender: UIButton) {
        let alert = UIAlertController(title: "Seleccione su sexo", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Masculino", style: .default, handler: { (action) in
            print("Masculino Selected to Update")
            self.updateSexType(type: .MALE)
        }))
        
        alert.addAction(UIAlertAction(title: "Femenino", style: .default, handler: { (action) in
            print("Femenino Selected to Update")
            self.updateSexType(type: .FEMALE)
        }))
        
        alert.addAction(UIAlertAction(title: "No especificar", style: .default, handler: { (action) in
            print("NoEspecificar Selected to Update")
            self.updateSexType(type: .NOT)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    
    fileprivate func updateDocumentType(type: DocTypeID) {
        var label: String?
        switch type {
        case .DNI:
            label = "DNI"
            
        case .CE:
            label = "Carnet de Extrangería"
            
        case .PASSPORT:
            label = "Pasaporte"
        
        case .RUC:
            label = "RUC"
        }
        
        btnDocType.setTitle(label, for: .normal)
    }
    
    fileprivate func updateSexType(type: SexType) {
        var sexLabel: String?
        switch type {
        case .MALE:
            sexLabel = "Masculino"
            
        case .FEMALE:
            sexLabel = "Femenino"
            
        case .NOT:
            sexLabel = "NO especificar"
        }
        
        btnSex.setTitle(sexLabel, for: .normal)
    }
}

extension SettingsAccountView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == inputNames) {
            print("update inputNames")
        }
        
        if (textField == inputLastnames) {
            print("update inputLastnames")
        }
        
        if (textField == inputDocNumber) {
            print("update docNumbers")
        }
        
        textField.resignFirstResponder()
        return true
    }
}
