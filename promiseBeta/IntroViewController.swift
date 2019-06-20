import UIKit



class IntroViewController: UIViewController {
    
    //UIImageの宣言
    @IBOutlet weak var titleLogo: UIImageView!
    
    
    //    var logoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLogo.image = UIImage(named: "Promise")!
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        //少し縮小するアニメーション
        UIView.animate(withDuration: 0.3,
                       delay: 1.0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
                        self.titleLogo.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { (Bool) in })
        
        
        
        //拡大させて、消えるアニメーション
        UIView.animate(withDuration: 0.7,
                       delay: 1.3,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
                        self.titleLogo.transform = CGAffineTransform(scaleX: 2, y: 2)
                        self.titleLogo.alpha = 0
        }, completion: { (Bool) in
            
            //終了後の処理
            self.titleLogo.removeFromSuperview()
            //画面移動の関数
            self.start()
            
        })
    }
    
    //画面移動の関数
    func start() {
        //まずは、同じstororyboard内であることをここで定義
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(StoryboradID)
        let toList = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.present(toList, animated: false, completion: nil)
    }
    
    
}

