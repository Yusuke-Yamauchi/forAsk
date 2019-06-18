import UIKit


//UITableView のメソッドを読むために UITableViewDelegate(tableViewのメソッドをインポート UITableViewDataSource付け加える

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //行の数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //辞書の配列の数だけRowができる
        return promiseUserC.count
        
    }
    
    //セルの内容を記述
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath)
   
    //配列の中の辞書のキーをとりだして定数aに入れる
        let a = promiseUserC[0]["prName"] as! String
        
        cell.textLabel?.text = a
        
        return cell
        
    }
    
    
    // セルをデリートする機能を付け加える
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            promiseUserC.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    
    //TableViewの宣言
    @IBOutlet weak var tableView: UITableView!
    //締結したPromiseを呼び出せるセル
    
    //ユーザーデフォルトから最終情報をとってくる
    var promiseUserC : [[String:Any]] = [[:]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //これを読み込まないとTableViewの機能が実行されない
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if UserDefaults.standard.object(forKey: "pData") != nil {
            promiseUserC = UserDefaults.standard.object(forKey: "pData") as! [[String : Any]]
            
            self.tableView.reloadData()
            
            
        }
        
    }
    
    
    
    @IBAction func backToSign(_ sender: Any) {
        
        //画面遷移 戻る！！！！！
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func toTop(_ sender: Any) {
        //画面遷移 最初に戻る！！！！！
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
