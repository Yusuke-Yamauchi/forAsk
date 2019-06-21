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
    
   
   
    //PDFに保存したいものが乗っているView
    @IBOutlet weak var promiseView: UIView!
    
    @IBOutlet weak var signImageView: UIImageView!
    

    override func viewWillAppear(_ animated: Bool) {
       //リストの何列目を押したか｡viewdidloadだと落ちる
        promiseMade = UserDefaults.standard.object(forKey:"promiseMade") as! [[String : Any]]
        selectedRow =  UserDefaults.standard.object(forKey:"selectedRow")as! Int
                promiseSelected = promiseMade[selectedRow]
        //手書きのサインを保存したPathを読み込んで､UIイメージに変換して表示
                let pathURL = URL(string:promiseSelected["signPath"] as! String)
        
                let image = UIImage(contentsOfFile:pathURL!.path)
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
        
        
        textView.text = "Promise Name:\n\(pName)\n\nDetails:\n\(details)\n\nPromise Date:\n\(pDate)\n\nDue Date:\n\(dDate)\n\nYour  Name:\n\(urName)\n\nPartner Name\n\(ptnName)\n\nPartner Email:\n\(ptnAdress))"
    }
    
    
    @IBAction func sendPromiseButton(_ sender: UIButton) {
        generatePDF(promiseSelected["prName"] as! String)
        
    }
    
    
    
    
    
    func generatePDF(_ fileName:String) {
        let promiseView = self.promiseView
        
        
        let dst = URL(fileURLWithPath: NSTemporaryDirectory().appending("\(fileName).pdf"))
        //path保存のためurlをstringに
        let url:String = dst.absoluteString
        promiseMade[selectedRow].updateValue(url, forKey: "pdfPath")
        UserDefaults.standard.set(promiseMade, forKey: "promiseMade")
        print(promiseMade)
        do {
            let data = try PDFGenerator.generated(by:promiseView!)
            try data.write(to: dst, options: .atomic)
        } catch (let error) {
            print(error)
        }


}
    
//    //イメージをローカルから読み込み
//    func loadImageFromPath(path: String) -> UIImage? {
//        let image = UIImage(contentsOfFile: path)
//        if image == nil {
//            print("missing image at: \(path)")
//        }
//        return image
//}
    
   
    
}
