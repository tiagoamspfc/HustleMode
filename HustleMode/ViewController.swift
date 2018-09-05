//
//  ViewController.swift
//  HustleMode
//
//  Created by Tiago on 05/09/18.
//  Copyright © 2018 Tiago. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var darkBlueBg: UIImageView!
    @IBOutlet weak var cloudsAndOrange: UIImageView!
    @IBOutlet weak var rocketLaunch: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var skyView: UIImageView!
    @IBOutlet weak var launchView: UIView!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
        
    }
    
    
    @IBAction func startRocket(_ sender: UIButton) {
        darkBlueBg.isHidden = true
        powerBtn.isHidden = true
        launchView.isHidden = false
        skyView.isHidden = false
        cloudsAndOrange.isHidden = false
        hustleLbl.isHidden = false
        rocketLaunch.isHidden = false
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocketLaunch.frame = CGRect(x:  0, y: 0, width: 414, height: 736)
        }) { (finished) in
            self.onLbl.isHidden = false
        }
    }
    

}

