//
//  DetailController.swift
//  layout
//
//  Created by Fairy on 2018/10/26.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

class DetailController: UITableViewController {
    
    var  area: AreaModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard area != nil else { return }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
