import UIKit
import FSCalendar
import CalculateCalendarLogic
import RealmSwift





//ディスプレイサイズ取得
let w = UIScreen.main.bounds.size.width
let h = UIScreen.main.bounds.size.height

class CalendarViewController: UIViewController,FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance {
    
    @IBOutlet weak var dateDisplayLabel: UILabel!
    @IBOutlet weak var tagDisplayLabel: UILabel!
    @IBOutlet weak var diaryDisplayLabel: UILabel!
   
    
    @IBOutlet weak var feelingDisplayImage: UIImageView!
    @IBOutlet weak var favDisplayImage: UIImageView!
    
    
    @IBOutlet weak var frameImage: UIImageView!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        
        backgroundImageView.frame.size = CGSize(width: view.frame.width * 2,  height: view.frame.height)
    }
    
    //カレンダー部分
    let dateView = FSCalendar(frame: CGRect(x: 0, y: 30, width: w, height: 400))
    
    @IBOutlet weak var calendar: FSCalendar!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        // 枠を角丸にする
               frameImage.layer.cornerRadius = 20.0
               frameImage.layer.masksToBounds = true
        
        let startOrigin = CGPoint.zero
        let endOrigin = CGPoint(x: -view.frame.width, y: 0)
        self.backgroundImageView.frame.origin = startOrigin
        UIView.animate(withDuration: 12.0,
                       delay: 0.0,
                       options: [.repeat, .curveLinear],
                       animations:{ self.backgroundImageView.frame.origin = endOrigin },
                       completion: nil)
        
        //カレンダー設定
        self.dateView.dataSource = self
        self.dateView.delegate = self
        self.dateView.today = nil
        self.dateView.tintColor = .red
        self.view.backgroundColor = .clear
        dateView.backgroundColor = .white
        
        //日付表示設定
        dateDisplayLabel.text = ""
        dateDisplayLabel.font = UIFont.systemFont(ofSize: 20.0)
        dateDisplayLabel.textColor = .white
        view.addSubview(dateDisplayLabel)
        
        //「タグ」表示設定
        tagDisplayLabel.text = ""
        tagDisplayLabel.textAlignment = .center
        tagDisplayLabel.textColor = .white
        tagDisplayLabel.font = UIFont.systemFont(ofSize: 20.0)
        view.addSubview(tagDisplayLabel)
        
        //スケジュール内容表示設定
        diaryDisplayLabel.text = ""
        diaryDisplayLabel.font = UIFont.systemFont(ofSize: 18.0)
        diaryDisplayLabel.textColor = .white
        view.addSubview(diaryDisplayLabel)
    
        //        feelingbutton表示設定
        let selectedImage = UIImage(named: "icon")
        feelingDisplayImage.image = selectedImage
        view.addSubview(feelingDisplayImage)
    }
    
    var displayImageNo = 0
    var imageNameArray = ["feeling1after","feeling2after","feeling3after","feeling4after","feeling5after","feeling6after",]
    
    func displayImage(displayImageNo: Int) {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let selectedImage = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        feelingDisplayImage.image = selectedImage
    }
    
    //     fav表示
    func favImage(favImage: Bool){
        if !favImage{
            favDisplayImage.image = nil
            return
        }
        let selectedImage = UIImage(named: "favAfter")
       
        // Image Viewに読み込んだ画像をセット
        favDisplayImage.image = selectedImage
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // 祝日判定を行い結果を返すメソッド
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする
        if self.judgeHoliday(date){
            return UIColor.red
        }
        
        //土日の判定
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        }
        else if weekday == 7 {
            return UIColor.blue
        }
        
        return nil
    }
    
    //カレンダー処理(スケジュール表示処理)
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        
        //予定がある場合、スケジュールをDBから取得・表示する。
        //無い場合、「スケジュールはありません」と表示。
        diaryDisplayLabel.text = "スケジュールはありません"
        diaryDisplayLabel.textColor = .lightGray
        //        view.addSubview(labelData)
        
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let m = String(format: "%02d", month)
        let d = String(format: "%02d", day)
        
        let da = "\(year)/\(m)/\(d)"
        
        //クリックしたら、日付が表示される。
        dateDisplayLabel.text = "\(year)/\(m)/\(d)"
        //        view.addSubview(Date)
        
        tagDisplayLabel.text = ""
        feelingDisplayImage.image = nil
        favDisplayImage.image = nil
        
        //スケジュール取得
        let realm = try! Realm()
        var result = realm.objects(Diary.self)
        print("result =", result)
        print("da =", da)
        result = result.filter("date = '\(da)'")
        print("result =", result)
        for resultData in result {
            if resultData.date == da {
                dateDisplayLabel.text = resultData.date
                diaryDisplayLabel.text = resultData.content
                tagDisplayLabel.text = resultData.tag
                displayImage(displayImageNo: resultData.feelingTag)
                favImage(favImage: resultData.favoriteDream)
                print("diaryDisplayLabel.text =", diaryDisplayLabel.text)
                view.addSubview(diaryDisplayLabel)
            }
        }
    }
}



