//
//  DetailViewController.swift
//  Sign Collector
//
//  Created by User on 9/9/15.
//  Copyright (c) 2015 CodeSWAT. All rights reserved.
//

import UIKit
//import CoreData

class DetailViewController: UIViewController {
    
    //var form1 = [NSManagedObject]()
    var form1:[Dictionary<String, AnyObject>] = []

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

    @IBAction func saveForm1(sender: AnyObject) {
        if self.firstName.text.isEmpty {
            let alert = UIAlertController(title: "Поля не заполены", message: "Все поля обязательнгы для заполнения", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))

            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        let imageDraw: NSData! = saveDwowing(self) as! NSData
        var lName = self.lastName.text
        var fName = self.firstName.text
        var area = self.areaInput.text
        var city = self.cityInput.text
        var street = self.streetInput.text
        var hNumder = self.houseNumber.text
        
        var dictionary: Dictionary<String, AnyObject> = ["fName": fName, "lName": lName, "area": area, "city": city, "street": street, "hNumder": hNumder, "signature": imageDraw]
        
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        //var inputData1 = defaults.objectForKey("Form1") as? NSArray
        
        if let inputData1 = defaults.objectForKey("Form1") as? NSArray {
            var inputData1 = defaults.objectForKey("Form1") as! Array<Dictionary<String, AnyObject>>
            
            inputData1.append(dictionary)
            defaults.setObject(inputData1, forKey: "Form1")
            defaults.synchronize()
        }
        else {
            form1.append(dictionary)
            defaults.setObject(form1, forKey: "Form1")
            defaults.synchronize()
        }
        self.cleanForm(self)
        
        /*
        self.saveForm(firstName.text, lN: lastName.text, aI: areaInput.text, cI: cityInput.text, sI:streetInput.text, hN: houseNumber.text)*/
    }
    
    
    func saveDwowing(sender: AnyObject) -> AnyObject {
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
        return data
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
    
    //work with database
    //получение данных из БД
    /*
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Forms")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            form1 = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    
    func saveForm(fN: String, lN: String, aI: String, cI: String, sI: String, hN: String) {
    //1
    let appDelegate =
    UIApplication.sharedApplication().delegate as! AppDelegate
    
    let managedContext = appDelegate.managedObjectContext!
    
    //2
    let entity =  NSEntityDescription.entityForName("Forms",
    inManagedObjectContext:
    managedContext)
    
    let record = NSManagedObject(entity: entity!,
    insertIntoManagedObjectContext:managedContext)
    
    //3
    record.setValue(fN, forKey: "first_Name")
    record.setValue(lN, forKey: "last_Name")
    record.setValue(aI, forKey: "area")
    record.setValue(cI, forKey: "city")
    record.setValue(sI, forKey: "street")
    record.setValue(hN, forKey: "house_number")
    //record.setValue(image, forKey: "signature")

    //4
    var error: NSError?
    if !managedContext.save(&error) {
        println("Could not save \(error), \(error?.userInfo)")
    }
    //5
    form1.append(record)
        houseNumber.text = String(form1.count)
    }
*/
}

