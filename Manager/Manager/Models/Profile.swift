//
//  Profile.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct Profile {
    var username: String
    var faculty: String
    var department: String
    var course: String
    var grade: Int
    
    static let `default` = Self(username: "Nakai", faculty: "工学部", department: "工学科", course: "知能情報", grade: 1)
}
