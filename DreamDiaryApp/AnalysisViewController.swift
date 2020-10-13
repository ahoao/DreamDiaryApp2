
import UIKit

//extension UIImage {
//
//    func rotatedBy(degree: CGFloat, isCropped: Bool = true) -> UIImage {
//        let radian = -degree * CGFloat.pi / 180
//        var rotatedRect = CGRect(origin: .zero, size: self.size)
//        if !isCropped {
//            rotatedRect = rotatedRect.applying(CGAffineTransform(rotationAngle: radian))
//        }
//        UIGraphicsBeginImageContext(rotatedRect.size)
//        let context = UIGraphicsGetCurrentContext()!
//        context.translateBy(x: rotatedRect.size.width / 2, y: rotatedRect.size.height / 2)
//        context.scaleBy(x: 1.0, y: -1.0)
//
//        context.rotate(by: radian)
//        context.draw(self.cgImage!, in: CGRect(x: -(self.size.width / 2), y: -(self.size.height / 2), width: self.size.width, height: self.size.height))
//
//        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return rotatedImage
//    }
//
//
//}


class AnalysisViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        
//        let image = UIImage(named: "background")
//        image?.rotatedBy(degree: 30, isCropped: false)
        
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




