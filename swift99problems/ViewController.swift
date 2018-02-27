//
//  ViewController.swift
//  swift99problems
//
//  Created by Henrique Valcanaia on 21/02/18.
//  Copyright © 2018 Henrique Valcanaia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(List(1, 1, 2, 3, 5, 8)!.reverse())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

