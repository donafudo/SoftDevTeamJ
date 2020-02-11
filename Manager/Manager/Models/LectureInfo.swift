//
//  ClassInfo.swift
//  Manager
//
//  Created by tawatamasato on 2019/12/11.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import Foundation
import RealmSwift

enum LectureImageType:String{
    case Programming="programming"
    case Language="language"
    case Math="math"
    case Internsip="internship"
    case Study="study"
    case Tetsugaku="tetsugaku"
    case AR="ar"
    case Art="art"
    case Career="career"
    case Jikken="jikken"
    case Keizai="keizai"
    case Law="law"
    case Music="music"
    case Ningen="ningen"
    case Science="science"
    case Seiji="seiji"
    case Shizen="shizen"
    case Sport="sport"
}
enum Semester:String {
    case Previous="previous"
    case Later="later"
    case None="none"
}

enum LectureCategory:String{
    case Kyoutu="共通"
    case Senmon="専門"
    case Senmonkiso="専門基礎"
}

enum LectureField:String{
    case Kyouyo="教養"
    case Sougo="総合"
    case Kikan="基幹"
    case Senmon="専門科目"
    case SenmonKiso="専門基礎科目"
    case Sensyuu="先修"
}

enum LectureSubject:String{
    case Jinbun="人文"
    case Shakai="社会"
    case Shizen="自然"
    case Kenkou="健康"
    case Sougou="総合"
    case Career="キャリア"
    case Ryudai="琉大特色"
    case Jouhou="情報"
    case English="英語"
    case OtherLanguage="他外国語"
    case Joho="情報技術系"
    case TinouAdvanced="知能情報アドバンスト"
    case Sougoryoku="総合力演習"
    case KenkyuJikken="研究・実験"
    case TinouJohoCore="知能情報コア"
    case SugakuKiso="数学基礎"
    case SugakuKisoSentaku="数学基礎選択"
    case KogakuYugo="工学融合"
    case TinoJouhoKanren="知能情報関連"
    case Sensyuu="先修"
}

class Lectureinfo: Object {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    
    @objc dynamic private var category: String=""
    @objc dynamic private var field: String=""
    @objc dynamic private var subject: String=""

    @objc dynamic var credit: Float = 2
    let grade = List<LecturedGrade>()
    @objc dynamic private var semester: String = ""
    @objc dynamic var isCompleted: Bool = false
    @objc dynamic var attendanceGrade : Int = 0
    @objc dynamic private var imageName: String=""
    
    var categoryType: LectureCategory? {
        get {return LectureCategory(rawValue: category)}
        set {category = newValue?.rawValue ?? ""}
    }
    var fieldType: LectureField? {
        get {return LectureField(rawValue: field)}
        set {field = newValue?.rawValue ?? ""}
    }
    var subjectType: LectureSubject? {
        get {return LectureSubject(rawValue: subject)}
        set {subject = newValue?.rawValue ?? ""}
    }
    
    var semesterType: Semester? {
        get {return Semester(rawValue: semester)}
        set {semester = newValue?.rawValue ?? ""}
    }
    
    var imageType: LectureImageType? {
        get {return LectureImageType(rawValue: imageName)}
        set {imageName = newValue?.rawValue ?? ""}
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}

class LecturedGrade:Object {
    @objc dynamic var grade: Int = 1
}
