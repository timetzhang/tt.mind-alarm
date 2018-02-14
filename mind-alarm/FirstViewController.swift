//
//  FirstViewController.swift
//  mind-alarm
//
//  Created by tt on 2018/2/14.
//  Copyright © 2018年 fantast. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var scenes:JSON = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        //initialize date picker
        self.datePicker.minimumDate = Date()
        
        startRequest()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonUp(_ sender: UIButton) {
        print(self.scenes[self.pickerView.selectedRow(inComponent: 0)]["music_file"])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.scenes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
        return "\(self.scenes[row]["name"])"
    }
    
    func startRequest() {
        Alamofire.request("http://mind-alarm-db.zhangtt.cn/getAwakeScenes").responseJSON { response in
            if let json = response.result.value {
                self.scenes = JSON(json)
                self.pickerView.reloadComponent(0)
            }
        }
    }
}

