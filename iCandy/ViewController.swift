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
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var languageField: UITextField!
    
    func createJSON() -> Parameters{
        let parameters: Parameters = [
            "message":
            ["name": messageField.text!,
            "pitch": pitchSlider.value,
            "speed": speedSlider.value,
            "lang": languageField.text!]
        ]
        return (parameters)
    }
    
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
        //titleLabel.text = "Pngis"
        
        /*Alamofire.request("https://httpbin.org/get").responseJSON{ response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
            
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }*/
        let jsonPara = self.createJSON()
        /*Alamofire.request("http://192.168.1.46:2648/speak", method: .post, parameters: jsonPara, encoding: JSONEncoding.default).responseJSON(){ response in
                //print(response.response)
                print(response.debugDescription)
        }*/
        
        //var alamoManager = Alamofire.SessionManager
        
       // alamoManager.default.session.configuration.timeoutIntervalForRequest = 0.1
        
        //alamoManager.default.session.configuration.timeoutIntervalForResource = 0.1
        
       /* Alamofire.SessionManager.default.session.configuration.timeoutIntervalForResource = 1
        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 1*/
        
        Alamofire.request("http://192.168.1.46:2648/speak", method: .post, parameters: jsonPara, encoding: JSONEncoding.default)
        
        
        print("we get here")
        
        
        
    }
    @IBAction func updateLabel(_ sender: UISlider) {
        pitchLabel.text = "Pitch " + String(floor(pitchSlider.value * 100)) + "%"
    }
    
    
    @IBAction func updateLabelSpeed(_ sender: AnyObject) {
        speedLabel.text = "Speed " + String(floor(speedSlider.value * 100)) + "%"
    }
}

//192.168.1.46:2648/speak
//completion(response: responsePackage)
