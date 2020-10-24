//
//  Config.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 13/10/20.
//

import Foundation

struct Config {
    
    static let baseURL = "https://parley-api.getsandbox.com/SBX"

    struct Endpoint {
        static let getAnnouncesRecents = Config.baseURL + "/announces?type=recents"
        static let getAnnouncesList = Config.baseURL + "/announces"
    }
    
    private init() {}
}
