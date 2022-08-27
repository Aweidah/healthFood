//
//  App.swift
//  healthFood
//
//  Created by khaled Aweidah on 8/10/22.
//

import Foundation
import CoreFoundation

class App: NSObject {
    
    // MARK:- Singleton
    var userRole: String?
    
    var loggedInUser: UserModel?
    
    var userLectures: [LectureModel]?
    
    // MARK:- Singleton
    static var shared : App = {
        let instance = App()
        return instance
    }()
}
