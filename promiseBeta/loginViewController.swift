//
//  loginViewController.swift
//  promiseBeta
//
//  Created by user on 2019/07/12.
//  Copyright © 2019 BCC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class loginViewController: UIViewController ,FUIAuthDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.authUI.delegate = self
        self.authUI.providers = providers
      //  AuthButton.addTarget(self,action: #selector(self.AuthButtonTapped(sender:)),for: .touchUpInside)
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AuthButtonTapped(_ sender: Any) {
        let authViewController = self.authUI.authViewController()
        // FirebaseUIのViewの表示
        self.present(authViewController, animated: true, completion: nil)
    }
    @IBOutlet weak var AuthButton: UIButton!
    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()!}}
    // 認証に使用するプロバイダの選択
    let providers: [FUIAuthProvider] = [
        FUIGoogleAuth(),
        FUIFacebookAuth()//,
     //   FUITwitterAuth(),
       // FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!)
    ]
    
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
        // 認証に成功した場合
        if error == nil {
            self.performSegue(withIdentifier: "toTopView", sender: self)
        }
        // エラー時の処理をここに書く
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
