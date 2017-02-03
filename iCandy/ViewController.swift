//
//  ViewController.swift
//  iCandy
//
//  Created by Jack Bailey on 13/10/2016.
//  Copyright © 2016 Jack Bailey. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //print("iOS 2.0")
        return 1
    }


    // MARK: Properties
    @IBOutlet weak var ipNameField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var languageField: UITextField!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    
    //var langPickerData: [String] = [String]()
    let langPickerData = ["English", "German", "French", "Italian", "Chinese", "American", "Korean"]
    var accent = "English"
    
    func createJSON() -> Parameters{
        let parameters: Parameters = [
            "message":
            ["name": messageField.text!,
            "pitch": pitchSlider.value,
            "speed": speedSlider.value,
            "lang": accent]
        ]
        return (parameters)
    }
    
    func sortOutAddress(ip: String) -> String{
        let fullAddress = "http://" + ip + "/api/speak"
        print(fullAddress)
        return fullAddress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up language picker
        languagePicker.delegate = self
        languagePicker.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return langPickerData.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return langPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //languageField.text = langPickerData[row]
        accent = langPickerData[row]
    }
    
    // MARK: Actions:
    
    @IBAction func sendButton(_ sender: UIButton) {
        let jsonPara = self.createJSON()
        print(jsonPara)
        var a = sortOutAddress(ip: ipNameField.text!)
        _ = Alamofire.request(a, method: .post, parameters: jsonPara, encoding: JSONEncoding.default)
    }
    
    @IBAction func updateLabel(_ sender: UISlider) {
        //pitchLabel.text = "Pitch " + String(floor(pitchSlider.value * 100)) + "%"
        pitchLabel.text = String(floor(pitchSlider.value * 100)) + "%"
    }
    
    
    @IBAction func updateLabelSpeed(_ sender: AnyObject) {
        //speedLabel.text = "Speed " + String(floor(speedSlider.value * 100)) + "%"
        speedLabel.text = String(floor(speedSlider.value * 100)) + "%"
    }
}

//192.168.1.46:2648/speak
//completion(response: responsePackage)
