import UIKit
import AVFoundation

//UITableView のメソッドを読むために UITableViewDelegate(tableViewのメソッドをインポート UITableViewDataSource付け加える

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    // ボタンの音変数
    var buttonAudioPlayer: AVAudioPlayer = AVAudioPlayer()
    func buttonSound() {
        if let sound = Bundle.main.path(forResource: "move", ofType: ".mp3") {
            buttonAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            // 結果表示のときに音を再生(Play)すると定義
            buttonAudioPlayer.prepareToPlay()
        }
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    //行の数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //辞書の配列の数だけRowができる
        return promiseUserC.count
        
    }
    
    //セルの内容を記述
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath)
        
        //配列の中の辞書のキーをとりだして定数aに入れる
        // let a = promiseUserC[indexPath.row]["prName"] as! String
        
        cell.textLabel?.text = promiseUserC[indexPath.row
            ]["prName"] as? String
        
        return cell
        
    }
    
    
    // セルをデリートする機能を付け加える
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            //消す前にまずpathを取得
            let fileName:String = promiseUserC[indexPath.row]["prName"] as! String
            //新規作成されたiPhoneの保存先フォルダの場所を取得
            let documentsURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("\(fileName).png")
            
            let pdfURL = documentsURL.appendingPathComponent("\(fileName).pdf")
            promiseUserC.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.set( promiseUserC, forKey: "promiseMade")
            //サイン画像ファイルとPDFも同時に削除する
           
            //サイン画像を削除
            do {
                
                try FileManager.default.removeItem( atPath: fileURL.path )
                
            } catch {
                
                //エラー処理
                print("error")
                
            }
            do {
                
                try FileManager.default.removeItem( atPath: pdfURL.path )
                
            } catch {
                
                //エラー処理
                print("pdfがありません")
                
            }
        }
    }
    
    
    //TableViewの宣言
    @IBOutlet weak var tableView: UITableView!
    //締結したPromiseを呼び出せるセル
    
    //ユーザーデフォルトから最終情報をとってくる
    var promiseUserC : [[String:Any]] = [[:]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //音を出す関数を読み込んでおく
        buttonSound()
        //これを読み込まないとTableViewの機能が実行されない
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if UserDefaults.standard.object(forKey: "promiseMade") != nil {
            promiseUserC = UserDefaults.standard.object(forKey: "promiseMade") as! [[String : Any]]
            
            self.tableView.reloadData()
            
            
        }
        
    }
    

    
    @IBAction func toTop(_ sender: Any) {
        
        self.buttonAudioPlayer.play()
        
        
        
        //画面遷移 最初に戻る！！！！！
        //同じストーリーボード
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(StoryboradID) 遷移先のclassを実体化 "instantiateViewController"
        let toList = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        //こここかであれば
        toList.fromListView = true
        
        self.present(toList, animated: false, completion: nil)
        UserDefaults.standard.removeObject(forKey: "pData")
        
    }
    

    
    //アラート関数
    func makePAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //segueで移動する際に値を渡す
    var selectedRow = 0
    
    
    
    //セルを選んだ際に実行するfunc
   
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedRow = indexPath.row
            UserDefaults.standard.set(selectedRow, forKey: "selectedRow")
        
            
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        print(selectedRow)
//
//
//        if segue.identifier == "segueToSendPDF" {
//            let sendPDFVC = segue.destination as! sendPDFViewController
//            sendPDFVC.promiseSelected = promiseUserC[selectedRow]
//        }
    }
        
    

