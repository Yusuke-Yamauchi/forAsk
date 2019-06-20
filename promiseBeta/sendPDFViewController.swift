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
   
        //手書きのサインを保存したPathを読み込んで､UIイメージに変換して表示
        let pathURL = URL(string:promiseSelected["signPath"] as! String)
        let image = UIImage(contentsOfFile:pathURL!.path)
            signImageView.image = image
        
     
    }
    //ListViewControllerから値を受け取る
    var promiseSelected:[String:Any] = [:]
    
    @IBOutlet weak var textLabel: UILabel!
    //PDFに保存したいものが乗っているView
    @IBOutlet weak var promiseView: UIView!
    
    @IBOutlet weak var signImageView: UIImageView!
    

    
    
    @IBAction func sendPromiseButton(_ sender: UIButton) {
        generatePDF()
    }
    
    
    
    
    
    func generatePDF() {
        let promiseView = self.promiseView
        
        
        let dst = URL(fileURLWithPath: NSTemporaryDirectory().appending("sample1.pdf"))
        // outputs as Data
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
