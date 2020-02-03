//
//  LectureDatabase.swift
//  Manager
//
//  Created by tawatamasato on 2019/12/11.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Foundation
import RealmSwift

class LectureDatabase {
    //singleton,使っていいかは微妙
    static let shared = LectureDatabase()
    
    let dbfileName = "default"
    
    private init() {
        copyRealmDatabase()
    }
    
    private func copyRealmDatabase(){
        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL!

        //すでにrealmデータベスが存在する場合は処理を終了
        if FileManager.default.fileExists(atPath: defaultRealmPath.path){
            return
        }
        //データベースをコピー
        let bundleRealmPath = Bundle.main.url(forResource: dbfileName, withExtension: "realm")
        do {
            try FileManager.default.copyItem(at: bundleRealmPath!, to: defaultRealmPath)
        } catch let error {
            fatalError("error copying realm file: \(error)")
        }
    }


    public func LoadLecterList() -> Results<Lectureinfo> {
        do{
            let realm = try Realm()
            let datas = realm.objects(Lectureinfo.self)
            return datas
        } catch let error {
            fatalError("\(error)")
        }
    }
    
    public func UpdateLecterData (lecture: Lectureinfo) {
        do {
          let realm = try Realm()
          try realm.write {
            realm.add(lecture, update: .modified)
            }
        } catch {
            
        }
    }
}


import SwiftUI
struct LectureList: View {
    @State var userData=LectureDatabase.shared.LoadLecterList()

    @State var a:String="aa"
    var body: some View {
        VStack{
            ForEach(userData.filter("name like '*情報*'"),id: \.self){data in
                Text(data.name!)
            }

        }
    }
}

struct LectureList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LectureList()
        }
    }
}
