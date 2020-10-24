//
//  RecoveryPasswordView.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 10/10/20.
//

import UIKit
import FontAwesome_swift
import NVActivityIndicatorView
import SinchVerification

class PasswordLoginView: UIViewController {

    @IBOutlet weak var cod1: UITextField!
    @IBOutlet weak var cod2: UITextField!
    @IBOutlet weak var cod3: UITextField!
    @IBOutlet weak var cod4: UITextField!
    
    let btnSubmit = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
        validateSMS()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contraseña"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func validateSMS() {
        
    }
    
    fileprivate func setup() {
        NVActivityIndicatorView.DEFAULT_COLOR = .purple
        NVActivityIndicatorView.DEFAULT_TYPE = .ballRotate
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        cod1.delegate = self
        cod2.delegate = self
        cod3.delegate = self
        cod4.delegate = self
        
        cod1.becomeFirstResponder()
        cod1.addTarget(self, action: #selector(self.textDidChange(textField:)), for: .editingChanged)
        cod2.addTarget(self, action: #selector(self.textDidChange(textField:)), for: .editingChanged)
        cod3.addTarget(self, action: #selector(self.textDidChange(textField:)), for: .editingChanged)
        cod4.addTarget(self, action: #selector(self.textDidChange(textField:)), for: .editingChanged)
        
        cod1.keyboardType = .numberPad
        cod2.keyboardType = .numberPad
        cod3.keyboardType = .numberPad
        cod4.keyboardType = .numberPad
        
        cod1.font = Constants.Font.LargeTitle
        cod2.font = Constants.Font.LargeTitle
        cod3.font = Constants.Font.LargeTitle
        cod4.font = Constants.Font.LargeTitle
        
        cod1.layer.cornerRadius = 15
        cod2.layer.cornerRadius = 15
        cod3.layer.cornerRadius = 15
        cod4.layer.cornerRadius = 15
        cod1.layer.masksToBounds = true
        cod2.layer.masksToBounds = true
        cod3.layer.masksToBounds = true
        cod4.layer.masksToBounds = true
        cod1.borderStyle =  .none
        cod2.borderStyle =  .none
        cod3.borderStyle =  .none
        cod4.borderStyle =  .none
        
        view.addSubview(btnSubmit)
        btnSubmit.layer.cornerRadius = 30
        btnSubmit.backgroundColor = UIColor(hex: "#3C3F7B")
        btnSubmit.setImage(UIImage.fontAwesomeIcon(name: .arrowRight, style: .solid, textColor: .white, size: CGSize(width: 30, height: 30)), for: .normal)
        btnSubmit.layer.shadowColor = UIColor.tertiarySystemBackground.cgColor
        btnSubmit.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        btnSubmit.layer.shadowRadius = 3.0
        btnSubmit.layer.shadowOpacity = 0.7
        btnSubmit.addTarget(self, action: #selector(loginSubmit), for: .touchUpInside)
    }

    @objc func loginSubmit(_ sender: UIButton) {
        validateLogin()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
           
            btnSubmit.snp.makeConstraints { (make) in
                make.right.equalTo(view.snp.right).offset(-18)
                make.bottom.equalTo(view.snp.bottom).offset(-(keyboardHeight + 18))
                make.width.equalTo(60)
                make.height.equalTo(60)
            }
        }
    }
    
    fileprivate func validateLogin() {
        let activityIndicatorView = NVActivityIndicatorView(frame: Frame.HUDProgress)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            activityIndicatorView.stopAnimating()
            self.navigationToHomeView()
        }
    }
    
    private func navigationToHomeView() {
        UserDefaults.standard.set(true, forKey: KEY_IS_LOGGED)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(RootHomeController())
    }
    
    @objc fileprivate func textDidChange(textField: UITextField) {
        let text = textField.text
        
        if text?.count == 1 {
            switch textField {
            case cod1:
                cod2.becomeFirstResponder()
            case cod2:
                cod3.becomeFirstResponder()
            case cod3:
                cod4.becomeFirstResponder()
            default:
                textField.becomeFirstResponder()
            }
        }
        
        if text?.count == 0 {
            switch textField {
            case cod4:
                cod3.becomeFirstResponder()
            case cod3:
                cod2.becomeFirstResponder()
            case cod2:
                cod1.becomeFirstResponder()
            default:
                textField.becomeFirstResponder()
            }
        }
        
        if (cod4.text?.count == 1) {
            btnSubmit.isEnabled = true
            btnSubmit.backgroundColor = UIColor(hex: "#3C3F7B")
            validateLogin()
        } else {
            btnSubmit.isEnabled = false
            btnSubmit.backgroundColor = UIColor(hex: "#8B8CAD")
        }
    }
    
}

extension PasswordLoginView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        return count <= 1
    }
}
