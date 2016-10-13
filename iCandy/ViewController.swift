//
//  ViewController.swift
//  iCandy
//
//  Created by Jack Bailey on 13/10/2016.
//  Copyright © 2016 Jack Bailey. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var ipNameField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Actions:
    
    @IBAction func sendButton(_ sender: UIButton) {
        titleLabel.text = "Pngis"
        Alamofire.request("https://httpbin.org/get").responseJSON{ response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
            
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
}

