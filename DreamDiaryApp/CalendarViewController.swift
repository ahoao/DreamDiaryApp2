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
    
    
    //スケジュール内容
    let labelData = UILabel(frame: CGRect(x: 5, y: 580, width: 400, height: 50))
    //「タグ」の表示
    let labelTag = UILabel(frame: CGRect(x: 0, y: 530, width: 180, height: 50))
    //カレンダー部分
    let dateView = FSCalendar(frame: CGRect(x: 0, y: 30, width: w, height: 400))
    //日付の表示
    let Date = UILabel(frame: CGRect(x: 5, y: 430, width: 200, height: 100))
    
    //    気持ちボタンの表示
    let feelingButton = UIImageView(frame: CGRect(x: 20, y:500, width: 100, height: 100))
    
    
    @IBOutlet weak var calendar: FSCalendar!
    
    var imageArray:Array<UIImageView> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let viewWidth:CGFloat = self.view.frame.width
        let viewHeight:CGFloat = self.view.frame.height
        
        //インスタンスの生成
        for i in 0..<9 {
            let imgView:UIImageView = UIImageView()
            imgView.image = UIImage(named: "back1")
            imgView.contentMode = .scaleAspectFit
            imgView.frame.size = CGSize(width: 2000, height: 2000)
            imageArray.append(imgView)
            self.view.addSubview(imageArray[i])
        }
        
        //アニメーション
        //１列目
        imageArray[0].center = CGPoint(x: -viewWidth / 2, y: viewHeight * 0.6)
        imageArray[1].center = CGPoint(x: 0, y: viewHeight * 0.3)
        imageArray[2].center =  CGPoint(x: viewWidth / 2, y: 0)
        
        //2列目
        imageArray[3].center = CGPoint(x: -viewWidth / 2, y: viewHeight * 1.2)
        imageArray[4].center = CGPoint(x: 0, y: viewHeight * 0.9)
        imageArray[5].center = CGPoint(x: viewWidth / 2, y: viewHeight * 0.6)
        imageArray[6].center = CGPoint(x: viewWidth, y: viewHeight * 0.3)
        
        //３列目
        imageArray[7].center = CGPoint(x: viewWidth / 2, y: viewHeight * 1.2)
        imageArray[8].center = CGPoint(x: viewWidth, y: viewHeight * 0.9)
        
        //アニメーションの設定
        //4秒間かけて、一定の速さで繰り返しのアニメーションを行う
        UIView.animate(withDuration: 4, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            //１列目
            self.imageArray[0].center = CGPoint(x: 0, y: viewHeight * 0.3)
            self.imageArray[1].center = CGPoint(x: viewWidth / 2, y: 0)
            self.imageArray[2].center = CGPoint(x: viewWidth, y: -viewHeight * 0.3)
            
            //2列目
            self.imageArray[3].center = CGPoint(x: 0, y: viewHeight * 0.9)
            self.imageArray[4].center = CGPoint(x: viewWidth / 2, y: viewHeight * 0.6)
            self.imageArray[5].center = CGPoint(x: viewWidth, y: viewHeight * 0.3)
            self.imageArray[6].center = CGPoint(x: viewWidth * 1.5, y: 0)
            
            //３列目
            self.imageArray[7].center = CGPoint(x: viewWidth, y: viewHeight * 0.9)
            self.imageArray[8].center = CGPoint(x: viewWidth * 1.5, y: viewHeight * 0.6)
        },completion:nil)
        
      


        
        //カレンダー設定
        self.dateView.dataSource = self
        self.dateView.delegate = self
        self.dateView.today = nil
        self.dateView.tintColor = .red
        self.view.backgroundColor = .clear
        dateView.backgroundColor = .white
        
        //日付表示設定
        Date.text = ""
        Date.font = UIFont.systemFont(ofSize: 20.0)
        Date.textColor = .white
        view.addSubview(Date)
        
        //「タグ」表示設定
        labelTag.text = ""
        labelTag.textAlignment = .center
        labelTag.textColor = .white
        labelTag.font = UIFont.systemFont(ofSize: 20.0)
        view.addSubview(labelTag)
        
        //スケジュール内容表示設定
        labelData.text = ""
        labelData.font = UIFont.systemFont(ofSize: 18.0)
        labelData.textColor = .white
        view.addSubview(labelData)
        
        
        //        feelingbutton表示設定
        let selectedImage = UIImage(named: "icon")
        feelingButton.image = selectedImage
        view.addSubview(feelingButton)
    }
    
    var displayImageNo = 0
    var imageNameArray = ["icon","icon2","icon3","icon4","icon5","icon6",]
    
    func displayImage(displayImageNo: Int) {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let selectedImage = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        feelingButton.image = selectedImage
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
        labelData.text = "スケジュールはありません"
        labelData.textColor = .lightGray
        //        view.addSubview(labelData)
        
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let m = String(format: "%02d", month)
        let d = String(format: "%02d", day)
        
        let da = "\(year)/\(m)/\(d)"
        
        //クリックしたら、日付が表示される。
        Date.text = "\(year)/\(m)/\(d)"
        //        view.addSubview(Date)
        
        labelTag.text = ""
        feelingButton.image = nil
        
        //スケジュール取得
        let realm = try! Realm()
        var result = realm.objects(Diary.self)
        print("result =", result)
        print("da =", da)
        result = result.filter("date = '\(da)'")
        print("result =", result)
        for resultData in result {
            if resultData.date == da {
                Date.text = resultData.date
                labelData.text = resultData.content
                labelTag.text = resultData.tag
                displayImage(displayImageNo: resultData.feelingTag)
                print("labelData.text =", labelData.text)
                view.addSubview(labelData)
            }
        }
             
            
          }
    }
    
    

