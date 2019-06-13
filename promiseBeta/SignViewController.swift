import UIKit
import Sketch


class SignViewController: UIViewController {
    
    var sendImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearButton.isHidden = false
    }
    
    
    
    @IBOutlet weak var sketchView: SketchView!
    
    @IBAction func backToTop(_ sender: Any) {
        
        
        
        
        
        //画面遷移 戻る！！！！！
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
   sketchView.clear()
    }
    
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func setPromiseButton(_ sender: Any) {
        clearButton.isHidden = true
        let image = GetImage()
        sendImage = image
        
        //メモ:別のストーリーボードの呼び出し方(今回は使わない)
/*       let testVC = self.storyboard?.instantiateViewController(withIdentifier: "testVC") as! testViewController
 
        testVC.imageView  .image = image
*/
        
        let setImage = saveImage(image:image,fileName: "サイン")
        
   print (setImage)
        
        
        
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
    
    print(fileURL)
    do {
        try pngImageData!.write(to: fileURL)
    } catch {
        //エラー処理
        return false
    }
    return true
}
}

