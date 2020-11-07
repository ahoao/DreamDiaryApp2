
import UIKit

class AnalysisViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var background2Imageview: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width ,  height: view.frame.height)
        background2Imageview.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
        
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
        
        let startOrigin2 = CGPoint(x: view.frame.width, y: 0.0)
        let endOrigin2 = CGPoint.zero
        self.background2Imageview.frame.origin = startOrigin2
        UIView.animate(withDuration: 12.0,
        delay: 0.0,
        options: [.repeat, .curveLinear],
        animations:{ self.background2Imageview.frame.origin = endOrigin2 },
        completion: nil)
    }
}




