import UIKit
import RealmSwift

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var resultTableView: UITableView!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
      var outputFav : String?
    var favoriteDream = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        //スケジュール取得
        let realm = try! Realm()
        outputFav = realm.objects(Diary.self).filter("favoriteDream = true")
    }

    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        return cell
    }

    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }



    }

