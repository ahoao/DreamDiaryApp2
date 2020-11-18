import UIKit
import RealmSwift
import FSCalendar
import CalculateCalendarLogic

class ShareViewController: UIViewController {
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var dateResult : String = ""
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var background2ImageView: UIImageView!
    
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
        background2ImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
    }
    
    
    @IBOutlet weak var saveViewLavel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var imageArray:Array<UIImageView> = Array()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        
        let startOrigin = CGPoint.zero
        let endOrigin = CGPoint(x: -view.frame.width, y: 0)
        self.backgroundImageView.frame.origin = startOrigin
        UIView.animate(withDuration: 12.0,
                       delay: 0.0,
                       options: [.repeat, .curveLinear],
                       animations:{ self.backgroundImageView.frame.origin = endOrigin },
                       completion: nil)
        
        let startOrigin2 = CGPoint(x: view.frame.width, y: 0.0)
        let endOrigin2 = CGPoint.zero
        self.background2ImageView.frame.origin = startOrigin2
        UIView.animate(withDuration: 12.0,
                       delay: 0.0,
                       options: [.repeat, .curveLinear],
                       animations:{ self.background2ImageView.frame.origin = endOrigin2 },
                       completion: nil)
        
        saveButton?.layer.cornerRadius = 10.0
        saveButton?.layer.masksToBounds = true
        saveButton?.layer.borderColor = UIColor.white.cgColor
        saveButton?.layer.borderWidth = 2.0
        saveButton?.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        cancelButton?.layer.cornerRadius = 10.0
        cancelButton?.layer.masksToBounds = true
        cancelButton?.layer.borderColor = UIColor.white.cgColor
        cancelButton?.layer.borderWidth = 2.0
        cancelButton?.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        
        print("tweetボタンが押された")
        let realm = try! Realm()
        var result = realm.objects(Diary.self)
        print("\(dateResult)")
        result = result.filter("date = '\(dateResult)'")
        for resultData in result {
            let text = resultData.content + "　今日こんな夢を見たよ！＠夢日記"
            //twitterに投稿したい文章をtextに入れる
            //               let text = "twitter用メッセージ"
            
            //.urlQueryAllowed : URLクエリ内で使用できる文字列で返却する
            guard let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
            
            guard let twitterURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") else {return}
            
            UIApplication.shared.open(twitterURL, options:[:], completionHandler: nil)
            
        }
    }
}
