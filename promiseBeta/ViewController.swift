                    import UIKit
                    
                    class ViewController: UIViewController {
                        
                        override func viewDidLoad() {
                            super.viewDidLoad()
                            
                        }
                        
                        override func viewWillAppear(_ animated: Bool) {
                            //全部のボタンを有効化
                            toListButton.isEnabled = true
                            detailButton.isEnabled = true
                            partnerButton.isEnabled = true
                            nextButton.isEnabled = true
                            }
                        
                        
                
                        
                        
                        
                        //詳細を保存する配列を代入する変数
                        
                        var data: [[String:Any]] = [[:]]
                        
                        
                        
                        //promiseNameのText
                        
                        @IBOutlet weak var promiseNameText: UITextField!
                        @IBOutlet weak var detailText: UITextField!
                        @IBOutlet weak var promiseDateText: UITextField!
                        @IBOutlet weak var dueDateText: UITextField!
                        @IBOutlet weak var yourNameText: UITextField!
                        @IBOutlet weak var partnerNameText: UITextField!
                        
                        //オフにするための変数
                        @IBOutlet weak var toListButton: UIButton!
                        @IBOutlet weak var detailButton: UIButton!
                        @IBOutlet weak var partnerButton: UIButton!
                        @IBOutlet weak var nextButton: UIButton!
                        
                        
                        //Detailの膜
                        @IBOutlet weak var detailView: UIView!
                        
                        
                        //partnerの膜
                        @IBOutlet weak var partnerView: UIView!
                        
                        
                        
                        
                        
                        
                        //Detailの膜をあけるボタン
                        @IBAction func detailButton(_ sender: Any) {
                            //膜を開く
                            detailView.isHidden = true
                            //全部のボタンを停止
                            toListButton.isEnabled = false
                            detailButton.isEnabled = false
                            partnerButton.isEnabled = false
                            nextButton.isEnabled = false
                        }
                        
                        //Partnerの膜をあけるボタン
                        @IBAction func partnerNameButton(_ sender: Any) {
                            //膜を開く
                            partnerView.isHidden = true
                            //全部のボタンを停止
                            toListButton.isEnabled = false
                            detailButton.isEnabled = false
                            partnerButton.isEnabled = false
                            nextButton.isEnabled = false
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
