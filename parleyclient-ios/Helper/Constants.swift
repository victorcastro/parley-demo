//
//  Constants.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 12/10/20.
//
import UIKit

let KEY_IS_LOGGED = "isLogged"
let KEY_HAS_BIOMETRIC_ID = "hasBiometricID"

struct Frame {
    static let CenterX = UIScreen.main.bounds.width / 2
    static let CenterY = UIScreen.main.bounds.height / 2
    static let HUDProgress = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 50, height: 50)
}


struct Constants {
        
    struct Color {
        struct Primary {
            static let Default = UIColor(hex: "#000000")
            static let Black = UIColor(hex: "#333333")
            static let Purple = UIColor(hex: "#3C3F7B")
            static let Red = UIColor(hex: "#E2574C")
        }
        
        struct Secundary {
            static let Default = UIColor(hex: "#8A8A8E")
            static let Black = UIColor(hex: "#999999")
            static let Purple = UIColor(hex: "#6A6ABB")
        }
        
        struct Tertiary {
            static let Default = UIColor(hex: "#C4C4C6")
        }
        
        struct Grayscale {
            static let Light = UIColor(hex: "#F9FAFB")
            static let Normal = UIColor(hex: "#E9EAEB")
            static let Dark = UIColor(hex: "#999999")
            static let Black = UIColor(hex: "#333333")
        }
    }
    
    struct Font {
        static let LargeTitle = UIFont.systemFont(ofSize: 34)
        static let LargeTitleBold = UIFont.systemFont(ofSize: 34, weight: .bold)
        static let Title1 = UIFont.systemFont(ofSize: 28)
        static let Title1Bold = UIFont.systemFont(ofSize: 28, weight: .bold)
        static let Title2 = UIFont.systemFont(ofSize: 22)
        static let Title2Bold = UIFont.systemFont(ofSize: 22, weight: .bold)
        static let Title3 = UIFont.systemFont(ofSize: 20)
        static let Title3Bold = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let Headline = UIFont.systemFont(ofSize: 17)
        static let HeadlineBold = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let Body = UIFont.systemFont(ofSize: 17)
        static let BodyBold = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let Callout = UIFont.systemFont(ofSize: 16)
        static let CalloutBold = UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let Subheadline = UIFont.systemFont(ofSize: 15)
        static let SubheadlineBold = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}
