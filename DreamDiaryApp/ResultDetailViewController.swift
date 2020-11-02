import UIKit
import RealmSwift

class ResultDetailViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width * 2,  height: view.frame.height)
        
    }
    
    @IBOutlet weak var dreamDateLabel: UILabel!
    @IBOutlet weak var dreamcontentLabel: UILabel!
    @IBOutlet weak var dreamTagLabel: UILabel!
    
    
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
        
        
        // 枠のカラー
        dreamcontentLabel.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamcontentLabel.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamcontentLabel.layer.cornerRadius = 20.0
        dreamcontentLabel.layer.masksToBounds = true
        
        // 枠のカラー
        dreamcontentLabel.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamcontentLabel.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamcontentLabel.layer.cornerRadius = 20.0
        dreamcontentLabel.layer.masksToBounds = true
        
        // 枠のカラー
        dreamTagLabel.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamTagLabel.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamTagLabel.layer.cornerRadius = 20.0
        dreamTagLabel.layer.masksToBounds = true
        
        // 枠のカラー
        dreamTagLabel.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        dreamTagLabel.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        dreamTagLabel.layer.cornerRadius = 20.0
        dreamTagLabel.layer.masksToBounds = true
        
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
        dreamcontentLabel.text = diary.content
        dreamTagLabel.text = diary.tag
        displayImage(displayImageNo: diary.feelingTag)
        favImage(favImage: diary.favoriteDream)
    }
}

