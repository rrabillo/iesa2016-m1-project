//
//  DetailViewController.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var imageViewPlan: UIImageView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()            
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.minimumZoomScale = 1.0
        
        self.scrollView.maximumZoomScale = 6.0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return self.imageViewPlan
    }
    
   
}






