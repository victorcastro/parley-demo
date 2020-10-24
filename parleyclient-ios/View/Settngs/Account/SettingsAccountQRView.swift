//
//  SettingsAccountQRView.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 21/10/20.
//

import UIKit

class SettingsAccountQRView: UIViewController {

    @IBOutlet weak var btnClose: UIButton!
    
    var currentBrightness: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentBrightness = UIScreen.main.brightness
        print(UIScreen.main.brightness)
        UIScreen.main.brightness = 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIScreen.main.brightness = currentBrightness
    }
    
    @IBAction func actionBtnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
