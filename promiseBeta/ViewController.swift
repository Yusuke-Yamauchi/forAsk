import UIKit
import Contacts


class ViewController: UIViewController, UITextFieldDelegate {
    
    
    //Listから来たかを調べる変数
    var fromListView:Bool?
    
    
    //立ち上がりの処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //エラーの時のUserdefaultsリセット
        //        UserDefaults.standard.removeObject(forKey: "pData")
        //        UserDefaults.standard.removeObject(forKey: "promiseMade")
        
        //Promisedateチェッカーを白にしてバックを不透明にする
        //        https://wayohoo.com/programming/swift/how-to-change-text-color-for-uidatepicker.html
        
        
        changePromiseDate.setValue(UIColor.white, forKey: "textColor")
        
        changePromiseDate.setValue(false, forKey: "highlightsToday")
        
        //duedateチェッカーを白にしてバックを不透明にする
        changeDueDate.setValue(UIColor.white, forKey: "textColor")
        
        changeDueDate.setValue(false, forKey: "highlightsToday")
        
        
    }
    
    override func viewDidAppear(_ animated:Bool){
        
        //Listから来たのであれば実行
        if fromListView ?? false {
            
            
            promiseNameText.text! =  ""
            detailButton.setTitle("", for: .normal)
            detailLongText.text! =  ""
            
            
            yourNameText.text! =  ""
            
            
            promiseDateButton.setTitle("", for: .normal)
            dueDateButton.setTitle("", for: .normal)
            
            partnerButton.setTitle("", for: .normal)
            partnerNameText.text =  ""
            partnerEmailText.text =  ""
            
            
            
            //placeholderを再設置
            
            
            //         detailLongText.attributedPlaceholder = NSAttributedString(string: "Add the detail of your Promise", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
            
            
            partnerNameText.attributedPlaceholder = NSAttributedString(string: "Add your Partner Name...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
            
            partnerEmailText.attributedPlaceholder = NSAttributedString(string: "Add your Partner's Email Adress...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
            
            fromListView = false
            
        }
    }
    
    
    
    
    //全てのボタンを無効にする関数
    func allDisable() {
        
        toListButton.isEnabled = false
        promiseNameText.isUserInteractionEnabled = false
        detailButton.isEnabled = false
        promiseDateButton.isEnabled = false
        dueDateButton.isEnabled = false
        partnerButton.isEnabled = false
        yourNameText.isUserInteractionEnabled = false
        nextButton.isEnabled = false
        
    }
    
    //全てのボタンを有効にする関数
    func allEnable() {
        
        toListButton.isEnabled = true
        promiseNameText.isUserInteractionEnabled = true
        detailButton.isEnabled = true
        promiseDateButton.isEnabled = true
        dueDateButton.isEnabled = true
        partnerButton.isEnabled = true
        yourNameText.isUserInteractionEnabled = true
        nextButton.isEnabled = true
    }
    
    
    
    //promiseNameの宣言
    @IBOutlet weak var promiseNameText: UITextField!
    //リターンで閉じるアクション
    @IBAction func promiseNameText(_ sender: Any) {
    }
    //detailの幕が開くボタンの宣言
    @IBOutlet weak var detailButton: UIButton!
    //Detailの膜 宣言
    @IBOutlet weak var detailView: UIView!
    //Detailの膜の中身の宣言
    @IBOutlet weak var detailLongText: UITextView!
    //promiseDateのチェッカーを表示させるためのボタンの宣言
    @IBOutlet weak var promiseDateButton: UIButton!
    //promiseDateチェッカーの宣言
    @IBOutlet weak var changePromiseDate: UIDatePicker!
    //PromiseDateチェッカーを消すボタン宣言
    @IBOutlet weak var closePromiseDate: UIButton!
    //dueDateのチェッカーを表示させるためにボタン宣言
    @IBOutlet weak var dueDateButton: UIButton!
    //dueDateチェッカーの宣言
    @IBOutlet weak var changeDueDate: UIDatePicker!
    //dueDateチェッカーを消すボタン宣言
    @IBOutlet weak var closeDueDate: UIButton!
    //yourNameの宣言
    @IBOutlet weak var yourNameText: UITextField!
    //リターンで閉じるアクション
    @IBAction func yourNameText(_ sender: Any) {
    }
    //partnerInfoのボタンの宣言
    @IBOutlet weak var partnerButton: UIButton!
    //partnerの膜 宣言
    @IBOutlet weak var partnerView: UIView!
    //Partnerの膜の中身宣言
    //先方の名前のテキストの宣言とリターンで閉じるアクション
    @IBOutlet weak var partnerNameText: UITextField!
    @IBAction func partnerNameText(_ sender: Any) {
    }
    
    //先方のEmailのテキストの宣言とリターンで閉じるアクション
    @IBOutlet weak var partnerEmailText: UITextField!
    @IBAction func partnerEmailText(_ sender: Any) {
    }
    
    //移動のButton宣言系
    @IBOutlet weak var toListButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //他の部分をタップするとキーボードが閉じる機能
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.detailLongText.isFirstResponder) {
            self.detailLongText.resignFirstResponder()
        }
        
        if (self.promiseNameText.isFirstResponder) {
            self.promiseNameText.resignFirstResponder()
        }
        
        if (self.yourNameText.isFirstResponder) {
            self.yourNameText.resignFirstResponder()
        }
        
        if (self.partnerNameText.isFirstResponder) {
            self.partnerNameText.resignFirstResponder()
        }
        
        if (self.partnerEmailText.isFirstResponder) {
            self.partnerEmailText.resignFirstResponder()
        }
        
    }
    
    
    
    
    
    
    
    //Detailの膜をあける透明ボタン
    @IBAction func detailButton(_ sender: Any) {
        allDisable()
        //膜を開く
        detailView.isHidden = false
    }
    
    
    //Detailの膜を閉じる
    @IBAction func addDetailButton(_ sender: Any) {
        
        
        //まずはアラート
        if detailLongText.text! == "" {
            
            showAlert(message:
                "Please Fill in the Blanks")
            
        } else {
            
            //膜を閉じる
            detailView.isHidden = true
            allEnable()
            
            if detailLongText != nil {
                detailButton.setTitle(detailLongText.text, for: .normal) // ボタンのタイトル
            }
            detailButton.setTitleColor(UIColor.black, for: .normal) // タイトルの色
            
        }
    }
    
    //膜の中のバックボタン
    @IBAction func backToTopD(_ sender: Any) {
        //膜を閉じる
        detailView.isHidden = true
        allEnable()
        
    }
    
    
    
    
    
    
    //___________PromiseDate部分！！！！！！！！
    // 日時を取得してButtonに表示させるための変数 初期値を入れる
    var promiseDateCheker: String = ""
    
    
    
    
    
    
    
    
    
    
    // promiseDateのチェッカーを表示
    @IBAction func promiseDateButton(_ sender: Any) {
        
        allDisable()
        //promiseDateチェッカーを表示
        changePromiseDate.isHidden = false
        closePromiseDate.isHidden = false
        
        let formatter = DateFormatter()
        //現在時刻をあらかじめ読み込んでいる。これによりまピッカーを回さないとボタンに表示されない問題を解決 NSDate() は現在時刻の関数
        formatter.dateFormat = "yyyy/MM/dd"
        promiseDateCheker = formatter.string(from: (NSDate() as Date))
        
        
    }
    
    
    //promiseDateチェッカーの関数、日時データをとる
    @IBAction func changePromiseDate(_ sender: Any) {
        
        let formatter = DateFormatter()
        //日本語の空のフォーマットにしている
        formatter.dateFormat = "yyyy/MM/dd"
        promiseDateCheker = formatter.string(from: (sender as AnyObject).date)
        
    }
    
    //promiseDateチェッカーを閉じて、ボタンに表示
    @IBAction func closePromiseDate(_ sender: UIButton) {
        promiseDateButton.setTitle(promiseDateCheker, for: .normal) // ボタンのタイトル
        promiseDateButton.setTitleColor(UIColor.black, for: .normal) // タイトルの色
        
        allEnable()
        changePromiseDate.isHidden = true
        closePromiseDate.isHidden = true
        
    }
    
    
    
    // 日時のチェッカーを取得してButtonに表示させるための変数
    
    var dueDateCheker: String = ""
    
    // dueDateButtonチェッカーを表示
    @IBAction func dueDateButton(_ sender: Any) {
        
        allDisable()
        changeDueDate.isHidden = false
        closeDueDate.isHidden = false
        
        
        let formatter = DateFormatter()
        //現在時刻をあらかじめ読み込んでいる。これによりまピッカーを回さないとボタンに表示されない問題を解決 NSDate() は現在時刻の関数
        formatter.dateFormat = "yyyy/MM/dd"
        dueDateCheker = formatter.string(from: (NSDate() as Date))
        
    }
    
    
    //dueDateチェッカーの関数、日時データをとる
    @IBAction func changeDueDate(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        dueDateCheker = formatter.string(from: (sender as AnyObject).date)
        
    }
    
    
    
    //dueDateチェッカーを閉じて、ボタンに表示
    @IBAction func closeDueDate(_ sender: Any) {
        dueDateButton.setTitle(dueDateCheker, for: .normal) // ボタンのタイトル
        dueDateButton.setTitleColor(UIColor.black, for: .normal) // タイトルの色
        
        allEnable()
        changeDueDate.isHidden = true
        closeDueDate.isHidden = true
        
    }
    
    
    
    
    
    
    //___________YourName部分!!!!!!!!!
    
    
    
    
    
    
    //___________partnerInfo部分!!!!!!!!!
    
    //Partnerの膜を開く
    @IBAction func partnerInfoButton(_ sender: Any) {
        //膜を開く
        partnerView.isHidden = false
        allDisable()
    }
    
    
    //Addして膜を閉じるボタン
    @IBAction func addPartnerButton(_ sender: Any) {
        
        //空白の場合のアラート
        if
            partnerNameText.text! == "" && partnerEmailText.text! == "" {
            
            showAlert(message:
                "Please Fill in the Blanks")
            
        } else {
            
            //PartnerInfono膜を閉じる
            partnerView.isHidden = true
            //ボタン回復
            allEnable()
            
            if partnerNameText != nil {
                partnerButton.setTitle(partnerNameText.text, for: .normal)
                partnerButton.setTitleColor(UIColor.black, for: .normal)}
            
        }
    }
    
    
    //膜の中のバックボタン
    @IBAction func backToTopP(_ sender: Any) {
        
        partnerView.isHidden = true
        allEnable()
        
    }
    
    
    
    //詳細を保存する配列を代入する変数
    var data: [String:Any] = [:]
    
    
    @IBAction func nextButton(_ sender: Any) {
        //promiseName OK
        let prName: String = promiseNameText.text!
        let dtl: String = detailLongText.text!
        let prDate = promiseDateCheker
        let dDate = dueDateCheker
        let urName: String = yourNameText.text!
        //PartnerInfoの名前とEmailを辞書で保存
        let prtInfoDic: [String: String] = ["name": partnerNameText.text!   , "email": partnerEmailText.text!]
        
        
        //各項目が空であれば
        if prName.isEmpty || dtl.isEmpty || prDate.isEmpty || dDate.isEmpty || urName.isEmpty || partnerNameText.text!.isEmpty || partnerEmailText.text!.isEmpty {
            
            showAlert(message:
                "Please Fill in the Blanks")
            return
        }
        
        if isValidEmail(partnerEmailText.text!) {
            
            data = ["prName": prName, "dtl": dtl, "prDate": prDate, "dDate": dDate, "urName": urName, "prtInfoDic": prtInfoDic]
            UserDefaults.standard.set( data, forKey: "pData")
            
        } else {
            
            showAlertE(message: "Please Fill in the E-mail Correctly")
        }
        
    }
    //アラートの関数宣言 入力
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //アラートの関数宣言 Emailにしてください
    func showAlertE(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //Emailのフォームかどうかを判断する関数宣言
    func isValidEmail(_ string: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: string)
        return result
    }
    
    
}


