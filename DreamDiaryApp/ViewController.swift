import UIKit
import FirebaseAuth

class ViewController: UIViewController {
     var provider: OAuthProvider?
    
    
    @IBAction func buttonDidPush() {
        print("buttonDidPush")
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)

        guard let provider = self.provider else { return }

        provider.customParameters = [
            "force_login": "true",
        ]

        provider.getCredentialWith(nil) { credential, error in
            guard let credential = credential, error == nil else {
                print("Error: \(error as Optional)")
                return
            }
            Auth.auth().signIn(with: credential) { (result, error) in
                // signIn後の処理
            }
        }
    }
    
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

