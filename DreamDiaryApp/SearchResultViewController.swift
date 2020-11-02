import UIKit
import RealmSwift

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var resultTableView: UITableView!
    
    let realm = try! Realm()
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var searchResultArray : Results<Diary>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        resultTableView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
  

    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultArray.count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Cellに値を設定する.  --- ここから ---
        let result = searchResultArray[indexPath.row]
        cell.textLabel?.text = result.date
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        cell.detailTextLabel?.text = result.date
        
        return cell
        
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // 別の画面に遷移
        performSegue(withIdentifier: "resultDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue.identifier =", segue.identifier)
        let resultDetailViewController:ResultDetailViewController = segue.destination as! ResultDetailViewController
        
        if segue.identifier == "resultDetailSegue" {
            let indexPath = self.resultTableView.indexPathForSelectedRow
            resultDetailViewController.diary = searchResultArray[indexPath!.row]
        }
        
    }
    
}

class FooTableView: UITableViewController {
  override func viewDidLoad() {

    // make UIImageView instance
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: self.tableView.frame.height))
    // read image
    let image = UIImage(named: "background.png")
    // set image to ImageView
    imageView.image = image
    // set alpha value of imageView
    imageView.alpha = 0.5
    // set imageView to backgroundView of TableView
    self.tableView.backgroundView = imageView

  }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) 

      // cellの背景を透過
        cell.backgroundColor = UIColor.clear
      // cell内のcontentViewの背景を透過
        cell.contentView.backgroundColor = UIColor.clear

      return cell
    }
}
