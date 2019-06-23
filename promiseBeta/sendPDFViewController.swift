//
//  sendPDFViewController.swift
//  promiseBeta
//
//  Created by user on 2019/06/20.
//  Copyright © 2019 BCC. All rights reserved.
//

import UIKit
import PDFGenerator
import MessageUI
class sendPDFViewController: UIViewController,MFMailComposeViewControllerDelegate {

    
    //下のTwitterで使うために空の宣言
    var pName:String = ""
    var details:String = ""
    var pDate:String = ""
    var dDate:String = ""
    var urName:String = ""
    var ptnInfo:[String:Any] = [:]
    var ptnName:String = ""
    var ptnAdress:String = ""
    
    
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
         pName = promiseSelected["prName"] as! String
         details = promiseSelected["dtl"] as! String
         pDate = promiseSelected["prDate"] as! String
         dDate = promiseSelected["dDate"] as! String
         urName = promiseSelected["urName"] as! String
         ptnInfo = promiseSelected["prtInfoDic"] as! [String:Any]
         ptnName = ptnInfo["name"] as! String
         ptnAdress = ptnInfo["email"] as! String
        
        
        textView.text = "\n\nPromise Name:\n\(pName)\n\nDetails:\n\(details)\n\nPromise Date:\n\(pDate)\n\nDue Date:\n\(dDate)\n\nYour  Name:\n\(urName)\n\nPartner Name\n\(ptnName)\n\nPartner Email:\n\(ptnAdress)"
    }
    
    
    @IBAction func sendPromiseButton(_ sender: UIButton) {
        generatePDF(promiseSelected["prName"] as! String)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
        self.sendMail()
        }
    }
    
    
    
    @IBAction func shareTwitter(_ sender: Any) {
        
        //上と同じように代入
        let pName:String = promiseSelected["prName"] as! String
        
        let urName:String = promiseSelected["urName"] as! String
        
        let ptnInfo = promiseSelected["prtInfoDic"] as! [String:Any]
        let ptnName:String = ptnInfo["name"] as! String
        
        
        let text: String =
        
        "\(ptnName)さんと\(pName)をPromiseしました！ \n #PROMISE! #仕事発注 #約束事 "


        //        "made a PROMISE! to \(ptnName) about \(pName) \n #PROMISE! "
//
        
        
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
            //print(fileURL)
        } catch (let error) {
            print(error)
        }
        
}
    
    //mailerを開いて中身を入れる関数
    func sendMail() {
        //メール送信が可能なら
        if MFMailComposeViewController.canSendMail() {
            //pdfFileの取得
            let fileName:String = promiseSelected["prName"] as! String
            //新規作成されたいiPhoneの保存先フォルダの場所を取得
            let documentsURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
             //新規作成されたいiPhoneの保存先フォルダの場所を取得
            let fileURL = documentsURL.appendingPathComponent("\(fileName).pdf")
          
            //pdfをNSDataとして取得
            let fileData = NSData(contentsOfFile: fileURL.path)
            
            //MFMailComposeVCのインスタンス
            let mail = MFMailComposeViewController()
            //MFMailComposeのデリゲート
            mail.mailComposeDelegate = self
            //送り先
            mail.setToRecipients([ptnAdress])
            //Cc
            //mail.setCcRecipients(["mike@gmail.com"])
            //Bcc
            //mail.setBccRecipients(["amy@gmail.com"])
            //件名
            mail.setSubject("\(urName)さんからPROMISE!が届きました。")
            //添付ファイル
            mail.addAttachmentData(fileData! as Data , mimeType: "application/pdf", fileName: pName)
            //メッセージ本文
            mail.setMessageBody("\(urName)さんからPROMISE!'\(pName)' が届いています。", isHTML: false)
            //メールを表示
            self.present(mail, animated: true, completion: nil)
            //メール送信が不可能なら
        } else {
            //アラートで通知
            let alert = UIAlertController(title: "No Mail Accounts", message: "Please set up mail accounts", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //エラー処理+送信後の行動を決定
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil {
            //送信失敗
            print("error")
        } else {
            switch result {
            case .cancelled:
print("cancel")
            //キャンセル
            case .saved:
print("saved")
            //下書き保存
            case .sent:
print("sent")
            //送信
            default:
                break
            }
            controller.dismiss(animated: true, completion: nil)
        }
    }
  
    
}
