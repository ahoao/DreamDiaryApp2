import UIKit
import FirebaseAuth
import TwitterKit


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if let session = session {
                let authToken = session.authToken
                let authTokenSecret = session.authTokenSecret
                let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)

                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error { return }
                    //Sign In Completed
                }
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
}


func unwindPrev(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    
}

