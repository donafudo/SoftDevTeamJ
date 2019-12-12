//
//  ClassInfo.swift
//  Manager
//
//  Created by tawatamasato on 2019/12/11.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Foundation
import RealmSwift

class Lectureinfo: Object {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var category: String?
    @objc dynamic var field: String?
    @objc dynamic var subject: String?
    @objc dynamic var credit: Int = 2
    @objc dynamic var isCompleted: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
