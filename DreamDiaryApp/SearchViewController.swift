import UIKit
import RealmSwift


class SearchViewController: UIViewController,UISearchBarDelegate {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var background2ImageView: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
        background2ImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
        
    }
    
    @IBOutlet weak var searchFeeling1Button: UIButton!
    @IBOutlet weak var searchFeeling2Button: UIButton!
    @IBOutlet weak var searchFeeling3Button: UIButton!
    @IBOutlet weak var searchFeeling4Button: UIButton!
    @IBOutlet weak var searchFeeling5Button: UIButton!
    @IBOutlet weak var searchFeeling6Button: UIButton!
    
    @IBOutlet weak var searchFavButton: UIButton!
    
    
    
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
         self.background2ImageView.frame.origin = startOrigin2
         UIView.animate(withDuration: 12.0,
         delay: 0.0,
         options: [.repeat, .curveLinear],
         animations:{ self.background2ImageView.frame.origin = endOrigin2 },
         completion: nil)
        
        // 押せそうにみえる影
        searchFeeling1Button.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFeeling1Button.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFeeling1Button.layer.shadowOpacity = 0.9
        searchFeeling1Button.layer.shadowRadius = 10
        
        // 押せそうにみえる影
        searchFeeling2Button.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFeeling2Button.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFeeling2Button.layer.shadowOpacity = 0.9
        searchFeeling2Button.layer.shadowRadius = 10
        
        // 押せそうにみえる影
        searchFeeling3Button.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFeeling3Button.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFeeling3Button.layer.shadowOpacity = 0.9
        searchFeeling3Button.layer.shadowRadius = 10
        
        // 押せそうにみえる影
        searchFeeling4Button.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFeeling4Button.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFeeling4Button.layer.shadowOpacity = 0.9
        searchFeeling4Button.layer.shadowRadius = 10
        
        // 押せそうにみえる影
        searchFeeling5Button.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFeeling5Button.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFeeling5Button.layer.shadowOpacity = 0.9
        searchFeeling5Button.layer.shadowRadius = 10
        
        // 押せそうにみえる影
        searchFeeling6Button.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFeeling6Button.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFeeling6Button.layer.shadowOpacity = 0.9
        searchFeeling6Button.layer.shadowRadius = 10
        
        // 押せそうにみえる影
        searchFavButton.layer.shadowColor = UIColor.shadowColor.cgColor
        searchFavButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchFavButton.layer.shadowOpacity = 0.9
        searchFavButton.layer.shadowRadius = 10
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toFavViewController" {
            // 2. 遷移先のViewControllerを取得
            let nc = segue.destination as? UINavigationController
            let vc = nc?.topViewController as! SearchResultViewController
            // 3. １で用意した遷移先の変数に値を渡す
            let realm = try! Realm()
            vc.searchResultArray = realm.objects(Diary.self).filter("favoriteDream = true").sorted(byKeyPath: "date")
        }
        
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toFeel1ViewController" {
            // 2. 遷移先のViewControllerを取得
            let nc = segue.destination as? UINavigationController
            let vc = nc?.topViewController as! SearchResultViewController
            // 3. １で用意した遷移先の変数に値を渡す
            let realm = try! Realm()
            vc.searchResultArray = realm.objects(Diary.self).filter("feelingTag == 0").sorted(byKeyPath: "date")
        }
        
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toFeel2ViewController" {
            // 2. 遷移先のViewControllerを取得
            let nc = segue.destination as? UINavigationController
            let vc = nc?.topViewController as! SearchResultViewController
            // 3. １で用意した遷移先の変数に値を渡す
            let realm = try! Realm()
            vc.searchResultArray = realm.objects(Diary.self).filter("feelingTag == 1").sorted(byKeyPath: "date")
        }
        
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toFeel3ViewController" {
            // 2. 遷移先のViewControllerを取得
            let nc = segue.destination as? UINavigationController
            let vc = nc?.topViewController as! SearchResultViewController
            // 3. １で用意した遷移先の変数に値を渡す
            let realm = try! Realm()
            vc.searchResultArray = realm.objects(Diary.self).filter("feelingTag == 2").sorted(byKeyPath: "date")
        }
            
            // segueのIDを確認して特定のsegueのときのみ動作させる
            if segue.identifier == "toFeel4ViewController" {
                // 2. 遷移先のViewControllerを取得
                let nc = segue.destination as? UINavigationController
                let vc = nc?.topViewController as! SearchResultViewController
                // 3. １で用意した遷移先の変数に値を渡す
                let realm = try! Realm()
                vc.searchResultArray = realm.objects(Diary.self).filter("feelingTag == 3").sorted(byKeyPath: "date")
            }
            
            // segueのIDを確認して特定のsegueのときのみ動作させる
            if segue.identifier == "toFeel5ViewController" {
                // 2. 遷移先のViewControllerを取得
                let nc = segue.destination as? UINavigationController
                let vc = nc?.topViewController as! SearchResultViewController
                // 3. １で用意した遷移先の変数に値を渡す
                let realm = try! Realm()
                vc.searchResultArray = realm.objects(Diary.self).filter("feelingTag == 4").sorted(byKeyPath: "date")
            }
            
            // segueのIDを確認して特定のsegueのときのみ動作させる
            if segue.identifier == "toFeel6ViewController" {
                // 2. 遷移先のViewControllerを取得
                let nc = segue.destination as? UINavigationController
                let vc = nc?.topViewController as! SearchResultViewController
                // 3. １で用意した遷移先の変数に値を渡す
                let realm = try! Realm()
                vc.searchResultArray = realm.objects(Diary.self).filter("feelingTag == 5").sorted(byKeyPath: "date")
            }
        }
    }

