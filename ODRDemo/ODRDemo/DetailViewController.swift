//
//  DetailViewController.swift
//  ODR Introduction
//
//  Created by Davis Allie on 26/09/2015.
//  Copyright © 2015 tutsplus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    var tagToLoad: String!
    
    /// 按需访问请求类
    var request: NSBundleResourceRequest!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 创建请求
        request = NSBundleResourceRequest(tags: [tagToLoad])
        // 尽可能大的完成请求
        request.loadingPriority = NSBundleResourceRequestLoadingPriorityUrgent
        // 设定优先级
        Bundle.main.setPreservationPriority(1.0, forTags: ["Circle", "Square"]) // 优先级高
        Bundle.main.setPreservationPriority(0.5, forTags: ["Hexagon", "Star"])  // 优先级低
        
        // 开始请求资源
        request.beginAccessingResources { (error) in
            if error == nil {
                OperationQueue.main.addOperation({
                    self.displayImages()
                })
//                DispatchQueue.main.async {
//                    self.displayImages()
//                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayImages() {
        if colorTags.contains(tagToLoad) {
            image1.image = UIImage(named: tagToLoad + " Circle")
            image2.image = UIImage(named: tagToLoad + " Square")
            image3.image = UIImage(named: tagToLoad + " Star")
            image4.image = UIImage(named: tagToLoad + " Hexagon")
        } else if shapeTags.contains(tagToLoad) {
            image1.image = UIImage(named: "Red " + tagToLoad)
            image2.image = UIImage(named: "Blue " + tagToLoad)
            image3.image = UIImage(named: "Green " + tagToLoad)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
