import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var background2ImageView: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
        background2ImageView.frame.size = CGSize(width: view.frame.width,  height: view.frame.height)
    }
    
    var array = ["a", "b", "c"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = array[indexPath.row]
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.textLabel?.textColor = UIColor.white
        return cell
        
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
        self.background2ImageView.frame.origin = startOrigin2
        UIView.animate(withDuration: 12.0,
        delay: 0.0,
        options: [.repeat, .curveLinear],
        animations:{ self.background2ImageView.frame.origin = endOrigin2 },
        completion: nil)
        
    }
    
    
    
}


