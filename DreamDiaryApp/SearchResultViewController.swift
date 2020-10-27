import UIKit
import RealmSwift

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var resultTableView: UITableView!
    
    let realm = try! Realm()
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var searchResultArray : Results<Diary>!
    
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
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "resultDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultDetailViewController:ResultDetailViewController = segue.destination as! ResultDetailViewController
        
        if segue.identifier == "resultDetailSegue" {
            let indexPath = self.resultTableView.indexPathForSelectedRow
            resultDetailViewController.diary = searchResultArray[indexPath!.row]
        }
        
    }
    
    
    
}
