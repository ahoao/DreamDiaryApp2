
import UIKit

class AnalysisViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width * 2,  height: view.frame.height)
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
        
        
    }
    
    
}




