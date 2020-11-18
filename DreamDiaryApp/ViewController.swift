import UIKit

extension UIColor {
           static let startColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
           static let endColor = #colorLiteral(red: 0.2852321628, green: 0.938419044, blue: 0.9285692306, alpha: 1)
       }

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var touchDiaryButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()

    
        touchDiaryButton.frame = CGRect(x: 25, y: 75, width: 150, height: 50)
        touchDiaryButton.setTitleColor(UIColor.white, for: .normal)
        touchDiaryButton.setTitle("どんな夢だった？", for: .normal)
        // 角丸で親しみやすく
        touchDiaryButton.layer.cornerRadius = touchDiaryButton.bounds.midY
        // 押せそうにみえる影
        touchDiaryButton.layer.shadowColor = UIColor.startColor.cgColor
        touchDiaryButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        touchDiaryButton.layer.shadowOpacity = 0.7
        touchDiaryButton.layer.shadowRadius = 10
        // グラデーションで強めのアピール (リサイズ非対応！）
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = touchDiaryButton.bounds
        gradientLayer.cornerRadius = touchDiaryButton.bounds.midY
        gradientLayer.colors = [UIColor.startColor.cgColor, UIColor.endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        touchDiaryButton.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    
}

