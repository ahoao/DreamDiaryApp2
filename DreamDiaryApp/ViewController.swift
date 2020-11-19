import UIKit

extension UIColor {
    static let startColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.4411654537)
    static let shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let endColor = #colorLiteral(red: 0, green: 0.3003636003, blue: 0.9495717883, alpha: 0.4534460616)
}

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var touchDiaryButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        touchDiaryButton.setTitleColor(UIColor.white, for: .normal)
        touchDiaryButton.setTitle("どんな夢だった？", for: .normal)
        // 角丸で親しみやすく
        touchDiaryButton.layer.cornerRadius = touchDiaryButton.bounds.midY
        // 押せそうにみえる影
        touchDiaryButton.layer.shadowColor = UIColor.shadowColor.cgColor
        touchDiaryButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        touchDiaryButton.layer.shadowOpacity = 0.8
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
    
    func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }
    
    
}
