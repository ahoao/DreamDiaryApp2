import UIKit
import RealmSwift

class ResultDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dreamDateLabel: UILabel!
    @IBOutlet weak var dreamcontentLabel: UILabel!
    @IBOutlet weak var dreamTagLabel: UILabel!
    
    
    @IBOutlet weak var dreamFeelingTagImage: UIImageView!
    @IBOutlet weak var favoriteDreamImage: UIImageView!
    
    
    
    
    let realm = try! Realm()
    var diary: Diary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      

        self.diary.date = self.dreamDateLabel.text!
        self.diary.content = self.dreamcontentLabel.text!
        self.diary.tag = self.dreamTagLabel.text!
        
        print("dreamcontentLabel.text =", dreamcontentLabel.text)
        view.addSubview(dreamcontentLabel)
        
    }
    
}





