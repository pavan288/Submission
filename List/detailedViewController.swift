//
//  detailedViewController.swift
//  List
//
//  Created by Pavan Powani on 15/10/16.
//  Copyright © 2016 Pavan Powani. All rights reserved.
//

import UIKit
import CoreData

class detailedViewController: UIViewController {

    @IBOutlet var viaSegueLabel: UILabel!
    var desc: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      viaSegueLabel.text = desc
        // Do any additional setup after loading the view.
    }
}