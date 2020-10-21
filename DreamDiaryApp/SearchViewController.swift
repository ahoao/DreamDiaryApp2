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
    
  
    @IBOutlet weak var tagSearchBar: UISearchBar!
    func searchBarButtonClicked(_ searchBar: UISearchBar) {
        print("DEBUG searchBarButtonClickedが呼び出された")
   self.performSegue(withIdentifier: "searchResult", sender: nil)
    }
}
