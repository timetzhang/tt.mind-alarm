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
import AVFoundation
import MediaPlayer

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var playingIndicator: UIActivityIndicatorView!
    
    //场景数据
    var scenes:JSON = []
    
    //播放器相关
    var playerItem:AVPlayerItem?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        playingIndicator.isHidden = true
        //get awake scenes datas
        getAwakeScenes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonUp(_ sender: UIButton) {
        //init player
        let music_file = self.scenes[self.pickerView.selectedRow(inComponent: 0)]["music_file"]
        print("\(music_file)")
        let url = URL(string: "\(music_file)")
        playerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem!)
        player!.play()
        playingIndicator.isHidden = false
        playingIndicator.startAnimating()
    }
    
    @IBAction func stopButtonUp(_ sender: UIButton) {
        player?.pause()
        playingIndicator.isHidden = true
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
    
    func getAwakeScenes() {
        Alamofire.request("http://mind-alarm-db.zhangtt.cn/getAwakeScenes").responseJSON { response in
            if let json = response.result.value {
                self.scenes = JSON(json)
                self.pickerView.reloadComponent(0)
            }
        }
    }
}

