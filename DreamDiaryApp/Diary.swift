import Foundation
import RealmSwift

class Event: Object {
    @objc dynamic var event = ""
    @objc dynamic var date = "" //yyyy.MM.dd
}

class Diary: Object {
    @objc dynamic var content:String = ""
    @objc dynamic var tag:String = ""
    
    open var primaryKey: String {
         return "content"
    }
}
