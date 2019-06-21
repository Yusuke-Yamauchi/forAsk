import UIKit
import Sketch


class SignViewController: UIViewController {
    //コンプリートしたpromiseデータを代入するは辞書の配列
    var promiseUser : [[String:Any]] = []
    var data:[String:Any] = [:]
    //スクリーン宣言
    @IBOutlet weak var sketchView: SketchView!
    //クリアボタン宣言
    @IBOutlet weak var clearButton: UIButton!
    
    
    var sendImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearButton.isHidden = false
        
        
        //トップページで入力したデータを呼び出してdataという辞書の配列に入れる
        if UserDefaults.standard.object(forKey: "pData") != nil {
            data = UserDefaults.standard.object(forKey: "pData") as! [String : Any]

        }
        if UserDefaults.standard.object(forKey: "promiseMade") != nil {
            promiseUser = UserDefaults.standard.object(forKey: "promiseMade") as! [[String : Any]]
        }
    }
    
    //バックボタン関数
    @IBAction func backToTop(_ sender: Any) {
        //画面遷移 戻る！！！！！
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //サインを消す
    @IBAction func clearButton(_ sender: UIButton) {
        sketchView.clear()
    }
    
    
    
    //手書きのサインををUIImageに変換
    func GetImage() -> UIImage{
        
        // キャプチャする範囲を取得.
        let rect = sketchView.bounds
        
        // ビットマップ画像のcontextを作成.
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        // 対象のview内の描画をcontextに複写する.
        sketchView.layer.render(in: context)
        
        // 現在のcontextのビットマップをUIImageとして取得.
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // contextを閉じる.
        UIGraphicsEndImageContext()
        
        return capturedImage
    }
    
    
    
    
    //イメージをローカルに保存
    func saveImage (image: UIImage, fileName: String ) -> Bool{
        //pngで保存する場合
        let pngImageData = image.pngData()
        // jpgで保存する場合
        //    let jpgImageData = UIImageJPEGRepresentation(image, 1.0)
        let documentsURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        
        do {
            try pngImageData!.write(to: fileURL)
            let url:String = fileURL.absoluteString
            data.updateValue(url, forKey: "signPath")
        } catch {
            //エラー処理
            return false
        }
      
        return true
    }
    
    
    
    @IBAction func makePAlert(_ sender: UIButton) {
        // ① UIAlertControllerクラスのインスタンスを生成
        // タイトル, メッセージ, Alertのスタイルを指定する
        // 第3引数のpreferredStyleでアラートの表示スタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "Decision", message: "Are you sure you want to PROMISE?", preferredStyle:  UIAlertController.Style.alert)
        
        // ② Actionの設定
        // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
        // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "PROMISE!", style: UIAlertAction.Style.default, handler:{
    
            (action: UIAlertAction!) -> Void in
            print("PROMISE!")
            
            //promiseを保存する
            self.makeP()
            
        })
        // キャンセルボタン
        let backAction: UIAlertAction = UIAlertAction(title: "Back", style: UIAlertAction.Style.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("Back")
        
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(backAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
    
    
    
    }

   
    //ここで全部を保存する関数!!!!!!!!ここに遷移をいれなければいけない。
func makeP() {
        clearButton.isHidden = true
        let image = GetImage()
        sendImage = image
        
    //まずは、同じstororyboard内であることをここで定義
    let storyboard: UIStoryboard = self.storyboard!
    //ここで移動先のstoryboardを選択(StoryboradIDはList)
    let toList = storyboard.instantiateViewController(withIdentifier: "List")
    //ここが実際に移動するコードList
    self.present(toList, animated: true, completion: nil)
    
        //メモ:別のストーリーボードの呼び出し方(今回は使わない)
        /*       let testVC = self.storyboard?.instantiateViewController(withIdentifier: "testVC") as! testViewController
         
         testVC.imageView  .image = image
         */
        
    let setImage = saveImage(image:image,fileName:data["prName"] as! String )
    print(setImage) //サインの保存が成功したらtrueを返す
        
        // トップページの配列辞書に空のsignを作ってそれを更新する場合は、promiseUser[0]["sign"] = setImage,
        
        
        // 配列の中にある辞書に新たなキーとその値を追加
        //とりあえず画像は別々に保存することにした
        //data.updateValue(setImage, forKey: "sign")
  
        
    
         promiseUser.append(data)
    
        UserDefaults.standard.set( promiseUser, forKey: "promiseMade")
    }
    
    

    
}

