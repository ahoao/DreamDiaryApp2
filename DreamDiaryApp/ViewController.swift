import UIKit
import SpriteKit

//class GameScene: SKScene {
//
//    var scrollNode:SKNode!
//
//    func didMoveToView(view: SKView) {
//           //背景
//           let backView = SKSpriteNode(imageNamed: "back1")
//    backView.position = CGPoint(x: 420, y: 0)
//    backView.run(SKAction.repeatForever(
//               SKAction.sequence([
//                SKAction.moveTo(x: -430.0, duration: 13.0),
//                SKAction.moveTo(x: 480, duration: 0.0)])))
//           self.addChild(backView)
//
//}

class ViewController: UIViewController {

    
    

    @IBOutlet weak var touchDiaryButton: UIButton!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
    
    override func viewDidLoad() {
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

