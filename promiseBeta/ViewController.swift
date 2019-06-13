import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //日時カウンターの白にしてバックを不透明にする
        //https://wayohoo.com/programming/swift/how-to-change-text-color-for-uidatepicker.html
        changePromiseDate.setValue(UIColor.white, forKey: "textColor")

        changePromiseDate.setValue(false, forKey: "highlightsToday")
        
        
        //detailの詳細が開いたらここに記載する説明
        //detail部分
        detailLongText.attributedPlaceholder = NSAttributedString(string: "Add the detail of your Promise...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        //partnerName部分
        partnerNameText.attributedPlaceholder = NSAttributedString(string: "Add your Partner Name...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        //partnerEmail部分
    partnerEmailText.attributedPlaceholder = NSAttributedString(string: "Add your Partner's Email Adress...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        
        
    }
    
    //詳細を保存する配列を代入する変数
    var data: [[String:Any]] = [[:]]
    
    
    
    //ViewController上のTextField宣言系。気にしなくていい
    @IBOutlet weak var promiseNameText: UITextField!
    @IBOutlet weak var detailText: UITextField!
 
    
    //promiseDateチェッカーの宣言
    @IBOutlet weak var changePromiseDate: UIDatePicker!

    
    // promiseDateのチェッカーを表示させるためのボタンの宣言
    @IBOutlet weak var promiseDateButton: UIButton!
    
    // 日時のチェッカーを取得してButtonに表示させるための変数
    var promiseDateChaker: String = ""
    
    // promiseDateのチェッカーを表示
    @IBAction func promiseDateButton(_ sender: Any) {
     //promiseDateチェッカーを表示
        changePromiseDate.isHidden = false
    }
    
    
    
    
    
    @IBAction func dueDateButton(_ sender: Any) {
        
        
        
        
    }
    
    

    @IBOutlet weak var yourNameText: UITextField!
    @IBOutlet weak var partnerInfoText: UITextField!
    
    
    //viewController上のButton宣言系 気にしなくていい。
    @IBOutlet weak var toListButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var partnerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    //Detailの膜 宣言
    @IBOutlet weak var detailView: UIView!
    //partnerの膜 宣言
    @IBOutlet weak var partnerView: UIView!
    

    
    
    
    
    
    
    
    //ここから実際の機能！！！！！
    
    
    
    
    
    
    
    
    
    //Detailの膜をあける透明ボタン テキストの上にのっている
    @IBAction func detailButton(_ sender: Any) {
        //膜を開く
        detailView.isHidden = false
    }
   
    
    
    //Detailの詳細テキストフィールド
    @IBOutlet weak var detailLongText: UITextField!
    
    //Detailの膜を閉じてテキストを記憶
    @IBAction func addDetailButton(_ sender: Any) {
        //膜を閉じる
        detailView.isHidden = true
        
        //            if detailLongText.text != "" { detailText.text or detailButton.text = detailLongText.text の頭文字を表示
    }
    
    
    //日時のカウンター
    @IBAction func changePromiseDate(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        
        promiseDateChaker =      formatter.string(from: (sender as AnyObject).date)

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Partnerの膜をあける透明ボタン テキストの上にのっている
    @IBAction func partnerInfoButton(_ sender: Any) {
        //膜を開く
        partnerView.isHidden = false
    }
    
    
    

    
   //Partnerの膜の中身
    //先方の名前のテキスト
    @IBOutlet weak var partnerNameText: UITextField!
    //先方のEmailのテキスト
    @IBOutlet weak var partnerEmailText: UITextField!
    

    
    
    
    

    @IBAction func addPartnerButton(_ sender: Any) {
        
        
        //PartnerInfono膜を閉じる
        partnerView.isHidden = true
        
        
    }
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        
        //すべての情報を入れる
        
        //promiseName
        var prName: String = promiseNameText.text!
        
        //detaile
        var dtl: String = detailLongText.text!
        
        //          var prDate = カウンターの値
        
        //          var dDate = カウンターの値
        
        var urName: String = yourNameText.text!
        
        
        //PartnerInfoの名前とEmailを辞書で保存
        var prtInfoDic: [String: String] = ["name": partnerNameText.text!   , "email": partnerEmailText.text!]
        
    }
    
    
    
    
    
}
