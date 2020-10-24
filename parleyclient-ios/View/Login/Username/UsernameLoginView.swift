//
//  UsernameSessionView.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 15/10/20.
//

import UIKit
import FontAwesome_swift
import SnapKit

class UsernameLoginView: UIViewController {

    @IBOutlet weak var stkUsername: UIStackView!
    @IBOutlet weak var iconFlag: UIButton!
    @IBOutlet weak var numPrefix: UILabel!
    @IBOutlet weak var inputMobile: UITextField!
    @IBOutlet weak var btnRegister: UILabel!
    
    let btnNext = UIButton()
    
    override func viewWillAppear(_ animated: Bool) {
        inputMobile.becomeFirstResponder()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Número de celular"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setup() {
        
        stkUsername.layer.cornerRadius = 15
        stkUsername.layer.masksToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        inputMobile.delegate = self
        inputMobile.defaultTextAttributes.updateValue(2.0, forKey: .kern)
        
        view.addSubview(btnNext)
        btnNext.isEnabled = false
        btnNext.layer.cornerRadius = 30
        btnNext.backgroundColor = UIColor(hex: "#8B8CAD")
        btnNext.setImage(UIImage.fontAwesomeIcon(name: .arrowRight, style: .solid, textColor: .white, size: CGSize(width: 30, height: 30)), for: .normal)
        btnNext.layer.shadowColor = UIColor.tertiarySystemBackground.cgColor
        btnNext.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        btnNext.layer.shadowRadius = 4.0
        btnNext.layer.shadowOpacity = 0.7
        btnNext.addTarget(self, action: #selector(continuePassword), for: .touchUpInside)
    }
    
    @objc func continuePassword(_ sender: UIButton) {
        navigationToPasswordView()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
           
            btnNext.snp.makeConstraints { (make) in
                make.right.equalTo(view.snp.right).offset(-18)
                make.bottom.equalTo(view.snp.bottom).offset(-(keyboardHeight + 18))
                make.width.equalTo(60)
                make.height.equalTo(60)
            }
        }
    }
    
    private func navigationToPasswordView() {
        navigationController?.pushViewController(PasswordLoginView(), animated: true)
    }
}

extension UsernameLoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        if (count >= 9) {
            btnNext.isEnabled = true
            btnNext.backgroundColor = UIColor(hex: "#3C3F7B")
        } else {
            btnNext.isEnabled = false
            btnNext.backgroundColor = UIColor(hex: "#8B8CAD")
        }
        
        return count <= 9
    }
}
