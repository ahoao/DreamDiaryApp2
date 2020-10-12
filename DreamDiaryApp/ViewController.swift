import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    

    
    
    @IBOutlet weak var touchDiaryButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        


        
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

