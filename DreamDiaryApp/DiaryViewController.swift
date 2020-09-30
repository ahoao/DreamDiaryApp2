
import UIKit
import TagListView
import RealmSwift



class DiaryViewController: UIViewController, TagListViewDelegate, UITextFieldDelegate {
    
    let MARGIN: CGFloat = 10
    
    let tagListView = TagListView()
    let textField = UITextField()
    
    @IBOutlet weak var diaryTextView: UITextView!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var displayTagView: TagListView!
    
    

    @IBOutlet weak var feelingButton1: UIButton!
    @IBOutlet weak var feelingButton2: UIButton!
    @IBOutlet weak var feelingButton3: UIButton!
    @IBOutlet weak var feelingButton4: UIButton!
    @IBOutlet weak var feelingButton5: UIButton!
    @IBOutlet weak var feelingButton6: UIButton!
    
    
      var diary: Diary! // 受け皿の用意
    
    @IBAction func diarySave(_ sender: Any) {
     let realm = try! Realm()

         try! realm.write {
             //日付表示の内容とスケジュール入力の内容が書き込まれる。
             let Events = [Diary(value: ["content": diaryTextView.text, "tag": tagTextField.text])]
             realm.add(Events)
             print("データ書き込み中")
         }
        
//        //日付表示の内容とスケジュール入力の内容が書き込まれる。
//                    let Events = [Diary(value: ["content": y_text.text, "tag": eventText.text])]
//                    realm.add(Events)
//                    print("データ書き込み中")
//                }

     print("データ書き込み完了")

     //前のページに戻る
     dismiss(animated: true, completion: nil)
        
        
        }

    // DB内のタスクが格納されるリスト。
    // 以降内容をアップデートするとリスト内は自動的に更新される。
    var taskArray = try! Realm().objects(Diary.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
        
        tagTextField.delegate = self
        
    }
    func setView() {
        
        view.addSubview(tagListView)
        view.addSubview(textField)
        
        tagListView.frame = CGRect(x: MARGIN, y: 50, width: view.frame.width-MARGIN*2, height: 0)
        
        // タグの削除ボタンを有効に
        tagListView.enableRemoveButton = true
        
        // 今回は削除ボタン押された時の処理を行う
        tagListView.delegate = self
        
        // タグの見た目を設定
        tagListView.alignment = .left
        tagListView.cornerRadius = 3
        tagListView.textColor = UIColor.black
        tagListView.borderColor = UIColor.lightGray
        tagListView.borderWidth = 1
        tagListView.paddingX = 10
        tagListView.paddingY = 5
        tagListView.textFont = UIFont.systemFont(ofSize: 16)
        tagListView.tagBackgroundColor = UIColor.white
        
        // タグ削除ボタンの見た目を設定
        tagListView.removeButtonIconSize = 10
        tagListView.removeIconLineColor = UIColor.black
        
        // テキストフィールドは適当にセット
        textField.delegate = self
        textField.placeholder = "タグを入力してください"
        textField.returnKeyType = UIReturnKeyType.done
        
        // レイアウト調整
        updateLayout()
    }
    
    // テキストフィールドの完了ボタンが押されたら
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if 0 < textField.text!.count {
            // タグを追加
            //                tagListView.addTag(textField.text!)
            displayTagView.addTag(tagTextField.text!)
            
            // テキストフィールドをクリアしてレイアウト調整
            textField.text = nil
            updateLayout()
        }
        return true
    }
    
    // タグ削除ボタンが押された
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        // リストからタグ削除
        sender.removeTagView(tagView)
        updateLayout()
    }
    
    func updateLayout() {
        // タグ全体の高さを取得
        tagListView.frame.size = tagListView.intrinsicContentSize
        
        textField.frame = CGRect(x: MARGIN, y: tagListView.frame.origin.y + tagListView.frame.height + 5, width: view.frame.width-MARGIN*2, height: 40)
    }
}






