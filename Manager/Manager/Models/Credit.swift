//
//  Credit.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Credit: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var field: String
    var subject: String
    var credit: Int
    var isCompleted: Bool
    fileprivate var imageName: String
}

extension Credit {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
