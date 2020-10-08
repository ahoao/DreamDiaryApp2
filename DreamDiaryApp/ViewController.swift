import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width * 2,  height: view.frame.height)
    }
    
    
    @IBOutlet weak var touchDiaryButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
    
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
        
        
        
        // 枠のカラー
        touchDiaryButton.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        touchDiaryButton.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        touchDiaryButton.layer.cornerRadius = 20.0
        touchDiaryButton.layer.masksToBounds = true
    }
    
    
    
}


func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    
}

