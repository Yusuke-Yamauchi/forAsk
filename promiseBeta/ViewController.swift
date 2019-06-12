import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    //Promise Name の詳細を保存する配列を代入する変数
    var data: [[String:Any]] = [[:]]

    //Detailを入力する時にあらわれるOverView
    @IBOutlet weak var overViewAdd: UIView!
  
    
    
    
    //約束の名前
    @IBOutlet weak var textPromiseName: UITextField!
  
    //詳細の入力画面を呼び出す
    @IBAction func openDetailText(_ sender: Any) {
    }
    
    //詳細入力の半透明のまView
    @IBOutlet weak var overViewDetail: UIView!
    
    //Detailを入力したText
    @IBOutlet weak var detailText: UITextField!
    
    
    @IBAction func detail(_ sender: Any) {
        
//        detail.text! = "詳細に書かれた頭何文字か保存して半透明overViewDetailを閉じる"
        
    }
    
    

   //自分の名前、自動入力？
    @IBOutlet weak var textYourName: UITextField!
    
    //サイン入力の画面へ遷移
    @IBAction func next(_ sender: Any) {
        
        
        
        
    }
    
    
    

}
