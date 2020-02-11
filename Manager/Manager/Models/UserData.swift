//
//  UserData.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Combine
import SwiftUI
import RealmSwift
//let userDefaults = UserDefaults.standard

final class UserData: ObservableObject {
    /*init() {
        userDefaults.register(defaults: ["showCompletedOnly": false])
    }*/
    @Published var showCompletedOnly = true/*userDefaults.bool(forKey: "showCompletedOnly")*/
    @Published var credits:Results<Lectureinfo> = creditData
    @Published var profile = Profile.default
}
