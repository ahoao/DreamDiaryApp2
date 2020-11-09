import UIKit
import RealmSwift
import TagListView

class ResultDetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var background2ImageView: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
         background2ImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
        
    }
    
    @IBOutlet weak var dreamDateLabel: UILabel!
    
    @IBOutlet weak var dreamContentTextView: UITextView!
    @IBOutlet weak var dreamContentView: UIView!
    
    @IBOutlet weak var dreamTagListView: TagListView!
    @IBOutlet weak var dreamTagFrameView: UIView!
    
    
    @IBOutlet weak var dreamFeelingTagImage: UIImageView!
    @IBOutlet weak var favoriteDreamImage: UIImageView!
    
    
    
    var displayImageNo = 0
    var imageNameArray = ["feeling1after","feeling2after","feeling3after","feeling4after","feeling5after","feeling6after",]
    
    let realm = try! Realm()
    var diary: Diary!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        detail()
        
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
        
        
        
        // 枠のカラー
        dreamContentView.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamContentView.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamContentView.layer.cornerRadius = 20.0
        dreamContentView.layer.masksToBounds = true
        
        // 枠のカラー
        dreamContentView.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamContentView.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamContentView.layer.cornerRadius = 20.0
        dreamContentView.layer.masksToBounds = true
        
        // 枠のカラー
        dreamTagFrameView.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamTagFrameView.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamTagFrameView.layer.cornerRadius = 20.0
        dreamTagFrameView.layer.masksToBounds = true
        
        // 枠のカラー
        dreamTagFrameView.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamTagFrameView.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamTagFrameView.layer.cornerRadius = 20.0
        dreamTagFrameView.layer.masksToBounds = true
        
    }
    
    func displayImage(displayImageNo: Int) {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        // 画像を読み込み
        let selectedImage = UIImage(named: name)
        // Image Viewに読み込んだ画像をセット
        dreamFeelingTagImage.image = selectedImage
    }
    //     fav表示
    func favImage(favImage: Bool){
        if !favImage{
            favoriteDreamImage.image = nil
            return
        }
        let selectedImage = UIImage(named: "favAfter")
        // Image Viewに読み込んだ画像をセット
        favoriteDreamImage.image = selectedImage
    }
    
    
    func detail(){
        dreamDateLabel.text = diary.date
        dreamContentTextView.text = diary.content
        
        var tag = diary.tag
        if tag.count > 0 {
            var tags = tag.components(separatedBy: ":")
            dreamTagListView.addTags(tags)
        }
        displayImage(displayImageNo: diary.feelingTag)
        favImage(favImage: diary.favoriteDream)
    }
}

