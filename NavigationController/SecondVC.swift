//
//  SecondVC.swift
//  NavigationController
//
//  Created by Миронов Влад on 06/03/2019.
//  Copyright © 2019 Миронов Влад. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var labelText: UILabel!
    
    var text = ""
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelText.text = text
    }
    

}
