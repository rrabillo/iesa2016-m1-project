//
//  DetailStandViewController.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 24/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import UIKit

class DetailStandViewController: UIViewController {
    
    

    @IBOutlet weak var standName: UILabel!
    
    
    var detailItem: AnyObject? {
        didSet {
             self.configureView()  
        }
    }
    
    func configureView() {
        print(detailItem)
        if let detail : AnyObject = self.detailItem {
           // let stand = detail as! Stand
           // self.themeLabel.text = stand.theme
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

