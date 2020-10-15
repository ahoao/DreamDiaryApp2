
import UIKit
import TagListView
import RealmSwift



class DiaryViewController: UIViewController, TagListViewDelegate, UITextFieldDelegate {
    
    var feelingButtonTag = Int()
    
    let MARGIN: CGFloat = 10
    
    let tagListView = TagListView()
    let textField = UITextField()
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.frame.size = CGSize(width: view.frame.width * 2,  height: view.frame.height)
    }
    
    @IBOutlet weak var diaryTextView: UITextView!
    @IBOutlet weak var tagTextField: UITextField!
    @IBOutlet weak var displayTagView: TagListView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var favoriteDreamButton: UIButton!
    
    
    @IBOutlet weak var feelingButton1: UIButton!
    
    @IBAction func feelingTag1(_ sender: UIButton) {
        feelingButtonTag = sender.tag
        
    }
    /// ボタンを押したタイミングで呼ばれます。
    @IBAction func didTouchDownButton() {
        // ボタンを縮こませます
        UIView.animate(withDuration: 0.2, animations: { 
            self.feelingButton1.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    /// ボタンを押下途中で指から離れたタイミングで呼ばれます。
    /// NOTE: ボタンに指が触れたままボタン外の領域まで指を移動したままにするとボタンが縮こまったままになってしまうのを防ぐ処理です。
    @IBAction func didTouchDragExitButton() {
        // 縮こまったボタンをアニメーションで元のサイズに戻します
        UIView.animate(withDuration: 0.2, animations: { 
            self.feelingButton1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    /// ボタンが指から離れたタイミングで呼ばれます。
    @IBAction func didTouchUpInsideButton() {
        
        // バウンド処理です
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 8,
                       options: .curveEaseOut,
                       animations: { () -> Void in
                        
                        self.feelingButton1.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    @IBAction func imageButtonChange(_ sender: Any) {
        
        let image = UIImage(named: "feeling1after")
        let state = UIControl.State.normal
        
        feelingButton1.setImage(image, for: state)
        
    }
    
    
    @IBOutlet weak var feelingButton2: UIButton!
    
    /// ボタンを押したタイミングで呼ばれます。
    @IBAction func didTouchDownButton2() {
        // ボタンを縮こませます
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton2.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    /// ボタンを押下途中で指から離れたタイミングで呼ばれます。
    /// NOTE: ボタンに指が触れたままボタン外の領域まで指を移動したままにするとボタンが縮こまったままになってしまうのを防ぐ処理です。
    @IBAction func didTouchDragExitButton2() {
        // 縮こまったボタンをアニメーションで元のサイズに戻します
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    /// ボタンが指から離れたタイミングで呼ばれます。
    @IBAction func didTouchUpInsideButton2() {
        // バウンド処理です
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 8,
                       options: .curveEaseOut,
                       animations: { () -> Void in
                        
                        self.feelingButton2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    @IBAction func imageButtonChange2(_ sender: Any) {
        let image = UIImage(named: "feeling2after")
               let state = UIControl.State.normal
               
               feelingButton2.setImage(image, for: state)
    }
    
    
    @IBOutlet weak var feelingButton3: UIButton!
    
    /// ボタンを押したタイミングで呼ばれます。
    @IBAction func didTouchDownButton3() {
        // ボタンを縮こませます
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton3.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    /// ボタンを押下途中で指から離れたタイミングで呼ばれます。
    /// NOTE: ボタンに指が触れたままボタン外の領域まで指を移動したままにするとボタンが縮こまったままになってしまうのを防ぐ処理です。
    @IBAction func didTouchDragExitButton3() {
        // 縮こまったボタンをアニメーションで元のサイズに戻します
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton3.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    /// ボタンが指から離れたタイミングで呼ばれます。
    @IBAction func didTouchUpInsideButton3() {
        // バウンド処理です
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 8,
                       options: .curveEaseOut,
                       animations: { () -> Void in
                        
                        self.feelingButton3.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    @IBAction func imageButtonChange3(_ sender: Any) {
        let image = UIImage(named: "feeling3after")
                      let state = UIControl.State.normal
                      
                      feelingButton3.setImage(image, for: state)
    }
    
    @IBOutlet weak var feelingButton4: UIButton!
    
    /// ボタンを押したタイミングで呼ばれます。
    @IBAction func didTouchDownButton4() {
        // ボタンを縮こませます
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton4.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    /// ボタンを押下途中で指から離れたタイミングで呼ばれます。
    /// NOTE: ボタンに指が触れたままボタン外の領域まで指を移動したままにするとボタンが縮こまったままになってしまうのを防ぐ処理です。
    @IBAction func didTouchDragExitButton4() {
        // 縮こまったボタンをアニメーションで元のサイズに戻します
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton4.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    /// ボタンが指から離れたタイミングで呼ばれます。
    @IBAction func didTouchUpInsideButton4() {
        // バウンド処理です
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 8,
                       options: .curveEaseOut,
                       animations: { () -> Void in
                        
                        self.feelingButton4.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    @IBAction func imageButtonChange4(_ sender: Any) {
        let image = UIImage(named: "feeling4after")
        let state = UIControl.State.normal
        
        feelingButton4.setImage(image, for: state)
    }
    
    
    @IBOutlet weak var feelingButton5: UIButton!
    
    /// ボタンを押したタイミングで呼ばれます。
    @IBAction func didTouchDownButton5() {
        // ボタンを縮こませます
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton5.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    /// ボタンを押下途中で指から離れたタイミングで呼ばれます。
    /// NOTE: ボタンに指が触れたままボタン外の領域まで指を移動したままにするとボタンが縮こまったままになってしまうのを防ぐ処理です。
    @IBAction func didTouchDragExitButton5() {
        // 縮こまったボタンをアニメーションで元のサイズに戻します
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton5.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    /// ボタンが指から離れたタイミングで呼ばれます。
    @IBAction func didTouchUpInsideButton5() {
        // バウンド処理です
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 8,
                       options: .curveEaseOut,
                       animations: { () -> Void in
                        
                        self.feelingButton5.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    @IBAction func imageButtonChange5(_ sender: Any) {
        let image = UIImage(named: "feeling5after")
        let state = UIControl.State.normal
        
        feelingButton5.setImage(image, for: state)
    }
    
    @IBOutlet weak var feelingButton6: UIButton!
    
    /// ボタンを押したタイミングで呼ばれます。
    @IBAction func didTouchDownButton6() {
        // ボタンを縮こませます
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton6.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    /// ボタンを押下途中で指から離れたタイミングで呼ばれます。
    /// NOTE: ボタンに指が触れたままボタン外の領域まで指を移動したままにするとボタンが縮こまったままになってしまうのを防ぐ処理です。
    @IBAction func didTouchDragExitButton6() {
        // 縮こまったボタンをアニメーションで元のサイズに戻します
        UIView.animate(withDuration: 0.2, animations: {
            self.feelingButton6.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    /// ボタンが指から離れたタイミングで呼ばれます。
    @IBAction func didTouchUpInsideButton6() {
        // バウンド処理です
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 8,
                       options: .curveEaseOut,
                       animations: { () -> Void in
                        
                        self.feelingButton6.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    
    @IBAction func imageButtonChange6(_ sender: Any) {
        let image = UIImage(named: "feeling6after")
        let state = UIControl.State.normal
        
        feelingButton5.setImage(image, for: state)
        
    }
    
    var diary: Diary! // 受け皿の用意
    
    @IBAction func diarySave(_ sender: Any) {
        let realm = try! Realm()
        
        let selectedDate = datePicker.date
        print("datePickerの中身\(selectedDate)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let stringDate = dateFormatter.string(from: selectedDate)
        print("datePickerの中身\(selectedDate)")
        
        try! realm.write {
            //日付表示の内容とスケジュール入力の内容が書き込まれる。
            let Events = [Diary(value: ["content": diaryTextView.text as Any, "tag": tagTextField.text!, "feelingTag": feelingButtonTag, "date": stringDate])]

            print("データ書き込み完了")
            
            realm.add(Events)
            print("データ書き込み中")
        }
        
        print("データ書き込み完了")
        
        //前のページに戻る
        //     dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func touchSaveButton(_ sender: UIButton) {let vc = ShareViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // DB内のタスクが格納されるリスト。
    // 以降内容をアップデートするとリスト内は自動的に更新される。
    var taskArray = try! Realm().objects(Diary.self)
    
    var imageArray:Array<UIImageView> = Array()
    
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
        
        
        self.setView()
        
        
        
        tagTextField.delegate = self
        
        //        let feelingButtontag = feelingButton1.tag
        
        // 枠のカラー
        diaryTextView.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        diaryTextView.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        diaryTextView.layer.cornerRadius = 20.0
        diaryTextView.layer.masksToBounds = true
        
        // 枠のカラー
        tagTextField.layer.borderColor = UIColor.white.cgColor
        
        // 枠の幅
        tagTextField.layer.borderWidth = 2.0
        
        // 枠を角丸にする
        tagTextField.layer.cornerRadius = 20.0
        tagTextField.layer.masksToBounds = true
        
        
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






