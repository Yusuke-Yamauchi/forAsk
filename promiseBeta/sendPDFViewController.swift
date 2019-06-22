//
//  sendPDFViewController.swift
//  promiseBeta
//
//  Created by user on 2019/06/20.
//  Copyright © 2019 BCC. All rights reserved.
//

import UIKit
import PDFGenerator
class sendPDFViewController: UIViewController {

    
    //下のTwitterで使うために空の宣言
    let pName:String = ""
    let details:String = ""
    let pDate:String = ""
    let dDate:String = ""
    let urName:String = ""
    let ptnInfo = ""
    let ptnName:String = ""
    let ptnAdress:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

      //テキストビューを編集不能にする
        textView.isEditable = false
        textView.isSelectable = false
        
    
        
     
    }
    var promiseMade:[[String:Any]] = []
    var selectedRow:Int = 0
    
    //ListViewControllerから値を受け取る
    var promiseSelected:[String:Any] = [:]
    
    @IBOutlet weak var textView: UITextView!

    
    @IBAction func backToList(_ sender: Any) {
        //画面遷移 戻る！！！！！
        self.dismiss(animated: true, completion: nil)

    }
    
    
    
    //PDFに保存したいものが乗っているView
    @IBOutlet weak var promiseView: UIView!
    
    @IBOutlet weak var signImageView: UIImageView!
    

    override func viewWillAppear(_ animated: Bool) {
       //リストの何列目を押したか｡viewdidloadだと落ちる
        promiseMade = UserDefaults.standard.object(forKey:"promiseMade") as! [[String : Any]]
        selectedRow =  UserDefaults.standard.object(forKey:"selectedRow")as! Int
                promiseSelected = promiseMade[selectedRow]
        //手書きのサインを保存したPathを読み込んで､UIイメージに変換して表示
        let fileName:String = promiseSelected["prName"] as! String
        let documentsURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("\(fileName).png")
        
                let image = UIImage(contentsOfFile:fileURL.path)
                    signImageView.image = image
        
        //内容表示
        let pName:String = promiseSelected["prName"] as! String
        let details:String = promiseSelected["dtl"] as! String
        let pDate:String = promiseSelected["prDate"] as! String
        let dDate:String = promiseSelected["dDate"] as! String
        let urName:String = promiseSelected["urName"] as! String
        let ptnInfo = promiseSelected["prtInfoDic"] as! [String:Any]
        let ptnName:String = ptnInfo["name"] as! String
        let ptnAdress:String = ptnInfo["email"] as! String
        
        
        textView.text = "\n\nPromise Name:\n\(pName)\n\nDetails:\n\(details)\n\nPromise Date:\n\(pDate)\n\nDue Date:\n\(dDate)\n\nYour  Name:\n\(urName)\n\nPartner Name\n\(ptnName)\n\nPartner Email:\n\(ptnAdress))"
    }
    
    
    @IBAction func sendPromiseButton(_ sender: UIButton) {
        generatePDF(promiseSelected["prName"] as! String)
        
        
    }
    
    
    
    @IBAction func shareTwitter(_ sender: Any) {
        
        //上と同じように代入
        let pName:String = promiseSelected["prName"] as! String
        
        let urName:String = promiseSelected["urName"] as! String
        
        let ptnInfo = promiseSelected["prtInfoDic"] as! [String:Any]
        let ptnName:String = ptnInfo["name"] as! String
        
        
        let text: String =
        
//        "\(ptnName)さんと\(pName)をPromiseしました！ \n #PROMISE! "
//

        "made a PROMISE! to \(ptnName) about \(pName) \n #PROMISE! "
        
        
        
        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        if let encodedText = encodedText,
            let url = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
        print(text)
        
        }
        
        
        
        
    }
    
    
    
    
    
    func generatePDF(_ fileName:String) {
        let promiseView = self.promiseView
        let fileName:String = promiseSelected["prName"] as! String
        //新規作成されたいiPhoneの保存先フォルダの場所を取得
        let documentsURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
        
        let fileURL = documentsURL.appendingPathComponent("\(fileName).pdf")

        do {
            let data = try PDFGenerator.generated(by:promiseView!)
            try data.write(to: fileURL, options: .atomic)
            print(fileURL)
        } catch (let error) {
            print(error)
        }
        
}
    

   
    
}
