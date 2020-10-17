import Foundation
import RealmSwift

class Event: Object {
    @objc dynamic var event = ""
    @objc dynamic var date = "" //yyyy.MM.dd
}

class Diary: Object {
    @objc dynamic var content:String = ""
    @objc dynamic var tag:String = ""
    @objc dynamic var feelingTag:Int = 0
    @objc dynamic var date: String = ""
    @objc dynamic var favoriteDream:Bool = false
    
    open var primaryKey: String {
         return "content"
    }
}
