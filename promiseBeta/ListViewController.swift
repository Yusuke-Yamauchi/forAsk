//
//  ListViewController.swift
//  promiseBeta
//
//  Created by 潤田中 on 2019/06/12.
//  Copyright © 2019 BCC. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
