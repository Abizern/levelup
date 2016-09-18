//
//  ViewController.swift
//  levelup
//
//  Created by Gemma Barrett on 31/08/2016.
//  Copyright © 2016 Gem Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var redRing: RingsView!
    @IBOutlet weak var orangeRing: RingsView!
    @IBOutlet weak var yellowRing: RingsView!
    
    @IBOutlet weak var killsTab: UITabBarItem!
    @IBOutlet weak var damageTab: UITabBarItem!
    @IBOutlet weak var pointsTab: UITabBarItem!
    @IBOutlet weak var dataTabs: UITabBar!
        
    @IBOutlet weak var scoutNumber: UILabel!
    @IBOutlet weak var demomanNumber: UILabel!
    @IBOutlet weak var pyroNumber: UILabel!
    
    fileprivate let dataLoader = DataLoader()
        
    func tabBar(_ dataTabs: UITabBar, didSelect item: UITabBarItem) {
        let data = dataLoader.dataArray[item.tag-1]
        self.updateUI(with: data)
    }
    
    fileprivate func updateUI(with data: Data) {
        scoutNumber.text = String(data.scoutInt)
        demomanNumber.text = String(data.demomanInt)
        pyroNumber.text = String(data.pyroInt)
        redRing.endRing = CGFloat(data.scoutFloat)
        orangeRing.endRing = CGFloat(data.demomanFloat)
        yellowRing.endRing = CGFloat(data.pyroFloat)
    }
    
    override func viewDidLoad() {
        
        self.updateUI(with: dataLoader.dataArray[0])
        self.dataTabs.selectedItem = self.killsTab
        
        super.viewDidLoad()
        redRing.ringStrokeWidth = 35.0
        let backgroundRingColour = UIColor(white: 0.15, alpha: 1.0)
        redRing.ringBackgroundColour = backgroundRingColour

        orangeRing.ringColour = UIColor.orange
        orangeRing.ringStrokeWidth = 30.0
        orangeRing.ringBackgroundColour = backgroundRingColour
        
        yellowRing.ringColour = UIColor.yellow
        yellowRing.ringStrokeWidth = 25.0
        yellowRing.ringBackgroundColour = backgroundRingColour
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

