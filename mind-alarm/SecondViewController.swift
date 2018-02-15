//
//  SecondViewController.swift
//  mind-alarm
//
//  Created by tt on 2018/2/14.
//  Copyright © 2018年 fantast. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scenePicker: UIPickerView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var playingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopButtonUp(_ sender: UIButton) {
    }
    @IBAction func startButtonUp(_ sender: UIButton) {
    }
    
}

