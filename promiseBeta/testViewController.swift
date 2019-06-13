//
//  testViewController.swift
//  promiseBeta
//
//  Created by user on 2019/06/13.
//  Copyright © 2019 BCC. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
//var fileURL = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
let pullimage = readimage()
        imageView.image = pullimage
//view1 =
        // Do any additional setup after loading the view.
    }
//    cl = class()
    
    @IBOutlet weak var imageView: UIImageView!
    
    func readimage() -> UIImage?  {
        let documentsURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("サイン")
        
        return UIImage(contentsOfFile: fileURL.path)
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
