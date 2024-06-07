//
//  UserDefaultsManager.swift
//  Movie
//
//  Created by 전준영 on 6/7/24.
//

import Foundation

class UserDefaultsManager {
    
    var date: Int {
        
        get {
            return UserDefaults.standard.integer(forKey: "latestDate")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "latestDate")
        }
    }
    
    
}
