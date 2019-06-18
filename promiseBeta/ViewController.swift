import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // UserDefaults.standard.removeObject(forKey: "promiseMade")
//入力画面ないしkeyboardの外を押したら、キーボードを閉じる処理
        //
        promiseNameText.delegate = self
        detailLongText.delegate = self
        yourNameText.delegate = self
        partnerNameText.delegate = self
        partnerEmailText.delegate = self
        
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Promisedateチェッカーを白にしてバックを不透明にする
        //        https://wayohoo.com/programming/swift/how-to-change-text-color-for-uidatepicker.html
        
        
        changePromiseDate.setValue(UIColor.white, forKey: "textColor")
        
        changePromiseDate.setValue(false, forKey: "highlightsToday")
        
        //duedateチェッカーを白にしてバックを不透明にする
        changeDueDate.setValue(UIColor.white, forKey: "textColor")
        
        changeDueDate.setValue(false, forKey: "highlightsToday")
        
        
        
        //detailの詳細が開いたらここに記載する説明
        //detail部分初期値
        detailLongText.attributedPlaceholder = NSAttributedString(string: "Add the detail of your Promise...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        //partnerName部分初期値
        partnerNameText.attributedPlaceholder = NSAttributedString(string: "Add your Partner Name...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        //partnerEmail部分初期値
        partnerEmailText.attributedPlaceholder = NSAttributedString(string: "Add your Partner's Email Adress...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
    }
    
    
    //ViewController上のTextField宣言系
    
    //promiseNameの宣言
    @IBOutlet weak var promiseNameText: UITextField!
    func promiseNameTextShouldReturn(_ promiseNameText: UITextField) -> Bool{
        // キーボードを閉じる
    
        promiseNameText.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var detailButton: UIButton!
    //Detailの膜 宣言
    @IBOutlet weak var detailView: UIView!
    //Detailの膜の中身
    @IBOutlet weak var detailLongText: UITextField!{
        didSet {
            //textViewのtextの量に応じて、textViewの高さを決める
            detailLongText.translatesAutoresizingMaskIntoConstraints = true
        }
    }
    
    func detailLongTextShouldReturn(_ detailLongText: UITextField) -> Bool{
        // キーボードを閉じる
        detailLongText.resignFirstResponder()
        
        return true
    }
    
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
    
    func yourNameTextShouldReturn(_ yourNameText: UITextField) -> Bool{
        // キーボードを閉じる
        yourNameText.resignFirstResponder()
        
        return true
    }
    //partnerInfoのボタンの宣言
    @IBOutlet weak var partnerButton: UIButton!
    //partnerの膜 宣言
    @IBOutlet weak var partnerView: UIView!
    //Partnerの膜の中身宣言
    //先方の名前のテキスト
    @IBOutlet weak var partnerNameText: UITextField!
    func partnerNameTextShouldReturn(_ partnerNameText: UITextField) -> Bool{
        // キーボードを閉じる
        partnerNameText.resignFirstResponder()
        
        return true
    
    }
    //先方のEmailのテキスト
    @IBOutlet weak var partnerEmailText: UITextField!
    func partnerEmailTextShouldReturn(_ partnerEmailText: UITextField) -> Bool{
        // キーボードを閉じる
        partnerEmailText.resignFirstResponder()
        
        return true
    
    }
    
    //移動のButton宣言系
    @IBOutlet weak var toListButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    //___________promiseName部分!!!!!!!!!
    
    
    
    
    
    
    
    //___________Detail部分！！！！！！！！
    //Detailの膜をあける透明ボタン
    @IBAction func detailButton(_ sender: Any) {
        allDisable()
        //膜を開く
        detailView.isHidden = false
    }
    
    //Detailの膜を閉じる
    @IBAction func addDetailButton(_ sender: Any) {
        //膜を閉じる
        detailView.isHidden = true
        allEnable()
        
        //            if detailLongText.text != "" { detailText.text or detailButton.text = detailLongText.text の頭文字を表示
    }
    
    
    
    
    
    
    
    //___________PromiseDate部分！！！！！！！！
    // 日時のチェッカーを取得してButtonに表示させるための変数
    var promiseDateCheker: String = ""
    
    
    // promiseDateのチェッカーを表示
    @IBAction func promiseDateButton(_ sender: Any) {
        
        allDisable()
        //promiseDateチェッカーを表示
        changePromiseDate.isHidden = false
        closePromiseDate.isHidden = false
        
    }
    
    
    //promiseDateチェッカーの関数、日時データをとる
    @IBAction func changePromiseDate(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        
        promiseDateCheker =      formatter.string(from: (sender as AnyObject).date)
        
    }
    
    //promiseDateチェッカーを閉じて、ボタンに表示
    @IBAction func closePromiseDate(_ sender: UIButton) {
        promiseDateButton.setTitle(promiseDateCheker, for: .normal) // ボタンのタイトル
        promiseDateButton.setTitleColor(UIColor.black, for: .normal) // タイトルの色
        
        allEnable()
        changePromiseDate.isHidden = true
        closePromiseDate.isHidden = true
        
        
    }
    
    
    
    
    
    
    
    
    //___________DueDate部分!!!!!!!!!
    // 日時のチェッカーを取得してButtonに表示させるための変数
    
    
    var dueDateCheker: String = ""
    
    // dueDateButtonチェッカーを表示
    @IBAction func dueDateButton(_ sender: Any) {
        
        allDisable()
        changeDueDate.isHidden = false
        closeDueDate.isHidden = false
        
    }
    
    
    
    //dueDateチェッカーの関数、日時データをとる
    @IBAction func changeDueDate(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        
        dueDateCheker =      formatter.string(from: (sender as AnyObject).date)
        
        
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
    }
    
    
    @IBAction func addPartnerButton(_ sender: Any) {
        //PartnerInfono膜を閉じる
        partnerView.isHidden = true
    }
    
    
    
    
    
    //詳細を保存する配列を代入する変数
    var data: [String:Any] = [:]
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        
        //promiseName OK
        let prName: String = promiseNameText.text!
        //detaile OK
        let dtl: String = detailLongText.text!
        //promiseDate OK
        let prDate = promiseDateCheker
        //dueDate OK
        let dDate = dueDateCheker
        //yourName OK
        let urName: String = yourNameText.text!
        //partnerInfo OK
        //PartnerInfoの名前とEmailを辞書で保存
        let prtInfoDic: [String: String] = ["name": partnerNameText.text!   , "email": partnerEmailText.text!]
        
        //        let empty = ""
        
        
            data = ["prName": prName, "dtl": dtl, "prDate": prDate, "dDate": dDate, "urName": urName, "prtInfoDic": prtInfoDic]
        
        UserDefaults.standard.set( data, forKey: "pData")
        
    }
    
}

