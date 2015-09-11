//
//  DetailViewController.swift
//  Sign Collector
//
//  Created by User on 9/9/15.
//  Copyright (c) 2015 CodeSWAT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //@IBOutlet weak var detailDescriptionLabel: UILabel!
    
    //@IBOutlet var drawView : DrawView!
    @IBOutlet weak var drawView: DrawView!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var areaInput: UITextField!
    @IBOutlet weak var cityInput: UITextField!
    @IBOutlet weak var streetInput: UITextField!
    @IBOutlet weak var houseNumber: UITextField!

    @IBAction func cleanForm(sender: AnyObject) {
        var theDrawView : DrawView = drawView
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
        
        firstName.text = ""
        lastName.text = ""
        areaInput.text = ""
        cityInput.text = ""
        streetInput.text = ""
        houseNumber.text = ""

    }
    
    func saveDwowing(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let path = documents.stringByAppendingPathComponent("signature.png")
        let data = UIImagePNGRepresentation(image)
        var error: NSError?
        if !data.writeToFile(path, options: .DataWritingAtomic, error: &error) {
            println("writeToFile error: \(error)")
        }
    }
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            /*
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
*/
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

