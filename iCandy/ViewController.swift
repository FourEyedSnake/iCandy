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
        
        /*var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe"))
        var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
        var downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe"))
    
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        upSwipe.direction = .up
        downSwipe.direction = .down
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)*/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Actions:
    
    @IBAction func sendButton(_ sender: UIButton) {
        let jsonPara = self.createJSON()
        print(jsonPara)
        let a:DataRequest
        a = Alamofire.request("http://192.168.1.178:2648/speak", method: .post, parameters: jsonPara, encoding: JSONEncoding.default)
        
        print("we get here")
        
    }
    
    @IBAction func updateLabel(_ sender: UISlider) {
        pitchLabel.text = "Pitch " + String(floor(pitchSlider.value * 100)) + "%"
    }
    
    
    @IBAction func updateLabelSpeed(_ sender: AnyObject) {
        speedLabel.text = "Speed " + String(floor(speedSlider.value * 100)) + "%"
    }
    
/*    func handleSwipe(sender: UISwipeGestureRecognizer){
        if(sender.direction == .left) {
            print("LEFT")
        }
        if(sender.direction == .right) {
            print("RIGHT")
        }
        if(sender.direction == .up) {
            print("UP")
        }
        if(sender.direction == .down) {
            print("DOWN")
        }
    }*/
}

//192.168.1.46:2648/speak
//completion(response: responsePackage)
