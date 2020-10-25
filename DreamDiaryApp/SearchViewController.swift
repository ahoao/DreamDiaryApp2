import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width * 2,  height: view.frame.height)
        
        tagSearchBar.delegate = self
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
        
        
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toFavViewController" {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? SearchResultViewController
            // 3. １で用意した遷移先の変数に値を渡す
            next?.outputFav = 
        }
    }
    
    
    @IBOutlet weak var tagSearchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let SearchResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "searchResult")
        self.present(SearchResultViewController!, animated: true, completion: nil)}
}
