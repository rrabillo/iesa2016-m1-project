//
//  DetailViewController.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var imageViewPlan: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!


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
        // Do any additional setup after loading the    x@view, typically from a nib.
        self.imageViewPlan.image = UIImage (named: "plan_salon")
        //imageViewPlan!.frame = CGRectMake(0,0,100,200)
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateMinZoomScaleForSize(size: CGSize) {
        let widthScale = size.width / imageViewPlan.bounds.width
        let heightScale = size.height / imageViewPlan.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        
        scrollView.zoomScale = minScale
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(view.bounds.size)
    }
   
}

extension DetailViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(s   crollView: UIScrollView) -> UIView? {
        return imageViewPlan
    }
}





