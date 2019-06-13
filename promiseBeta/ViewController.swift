    import UIKit
    
    class ViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        override func viewWillAppear(_ animated: Bool) {

        }
        
        
        
        
        
        
        //詳細を保存する配列を代入する変数
        
        var data: [[String:Any]] = [[:]]
        
        
        
        //ViewController上のTextField宣言系
        @IBOutlet weak var promiseNameText: UITextField!
        @IBOutlet weak var detailText: UITextField!
        @IBOutlet weak var promiseDateText: UITextField!
        @IBOutlet weak var dueDateText: UITextField!
        @IBOutlet weak var yourNameText: UITextField!
        @IBOutlet weak var partnerNameText: UITextField!
        
        //iewController上のButton宣言系
        @IBOutlet weak var toListButton: UIButton!
        @IBOutlet weak var detailButton: UIButton!
        @IBOutlet weak var partnerButton: UIButton!
        @IBOutlet weak var nextButton: UIButton!
        
        //Detailの膜 宣言
        @IBOutlet weak var detailView: UIView!
        //partnerの膜 宣言
        @IBOutlet weak var partnerView: UIView!
        
        
        
        
        
        
        //Detailの膜をあける透明ボタン テキストの上にのっている
        @IBAction func detailButton(_ sender: Any) {
            //膜を開く
            detailView.isHidden = false
        }
        
        
        //Detailの詳細テキストフィールド
        @IBOutlet weak var detailLongText: UITextField!
        
        //膜を閉じてテキストを記憶
        @IBAction func addDetailButton(_ sender: Any) {
            //膜を閉じる
            detailView.isHidden = true
        }
        
        
        
        
        
        
        
        
    
        //Partnerの膜をあける透明ボタン テキストの上にのっている
        @IBAction func partnerNameButton(_ sender: Any) {
            //膜を開く
            partnerView.isHidden = false
        }
        

        
        
       //先方の名前のテキスト
        @IBAction func partnerNameText(_ sender: Any) {
        }
        
        //先方のEmailのテキスト
        @IBOutlet weak var partnerEmailText: UITextField!
        
    
        @IBAction func addPartnerButton(_ sender: Any) {
            //膜を閉じる
            partnerView.isHidden = true
        }
        
        
        
        
        
        
        
    }
