//
//  UserData.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Combine
import SwiftUI

//let userDefaults = UserDefaults.standard

final class UserData: ObservableObject {
    /*init() {
        userDefaults.register(defaults: ["showCompletedOnly": false])
    }*/
    @Published var showCompletedOnly = false/*userDefaults.bool(forKey: "showCompletedOnly")*/
    @Published var credits = creditData
    @Published var profile = Profile.default
}
