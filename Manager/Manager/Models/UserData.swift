//
//  UserData.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showCompletedOnly = false
    @Published var credits = creditData
    @Published var profile = Profile.default
}
