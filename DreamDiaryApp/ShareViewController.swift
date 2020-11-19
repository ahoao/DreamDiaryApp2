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
        
        //        ここから保存＆キャンセルのボタンカスタム
        
        saveButton?.setTitleColor(UIColor.white, for: .normal)
        saveButton?.setTitle("Tweetする", for: .normal)
        // 角丸で親しみやすく
        saveButton?.layer.cornerRadius = saveButton?.bounds.midY as! CGFloat
        // 押せそうにみえる影
        saveButton?.layer.shadowColor = UIColor.shadowColor.cgColor
        saveButton?.layer.shadowOffset = CGSize(width: 0, height: 3)
        saveButton?.layer.shadowOpacity = 0.7
        saveButton?.layer.shadowRadius = 10
        // グラデーションで強めのアピール (リサイズ非対応！）
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = saveButton?.bounds as! CGRect
        gradientLayer.cornerRadius = saveButton?.bounds.midY as! CGFloat
        gradientLayer.colors = [UIColor.startColor.cgColor, UIColor.endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        saveButton?.layer.insertSublayer(gradientLayer, at: 0)
        
        cancelButton?.setTitleColor(UIColor.white, for: .normal)
        cancelButton?.setTitle("キャンセル", for: .normal)
        // 角丸で親しみやすく
        cancelButton?.layer.cornerRadius = cancelButton?.bounds.midY as! CGFloat
        // 押せそうにみえる影
        cancelButton?.layer.shadowColor = UIColor.shadowColor.cgColor
        cancelButton?.layer.shadowOffset = CGSize(width: 0, height: 3)
        cancelButton?.layer.shadowOpacity = 0.7
        cancelButton?.layer.shadowRadius = 10
        // グラデーションで強めのアピール (リサイズ非対応！）
        let gradientLayer2 = CAGradientLayer()
        gradientLayer2.frame = cancelButton?.bounds as! CGRect
        gradientLayer2.cornerRadius = cancelButton?.bounds.midY as! CGFloat
        gradientLayer2.colors = [UIColor.startColor.cgColor, UIColor.endColor.cgColor]
        gradientLayer2.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer2.endPoint = CGPoint(x: 1, y: 1)
        
        cancelButton?.layer.insertSublayer(gradientLayer2, at: 0)
        
        
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
