//
//  Data.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/06.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

var creditData: [Credit] = load("creditData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func store(filename: String, credit: Credit) {
    creditData.append(credit)
    
    let encoder = JSONEncoder()
    
    var jsonstr = ""
    do {
        let content = try encoder.encode(credit)
        jsonstr = String(data: content, encoding: .utf8)!
    }catch{
        
    }
    
    let libraryPath = NSHomeDirectory() + "/Library/"
    // 保存する場所
    let filePath = libraryPath + filename
    
    do{
        try jsonstr.write(toFile:filePath, atomically: true, encoding: .utf8)
    }catch{
        
    }
}
