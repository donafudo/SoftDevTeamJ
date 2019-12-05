//
//  Credits.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct Credits {
    var name: String = "a"
    var field1: String
    var field2: String
    var field3: String
    var cresit: Int
    
    init(data: (String, String, String, String, Int)){
        name = data.0
        field1 = data.1
        field2 = data.2
        field3 = data.3
        cresit = data.4
    }
}
