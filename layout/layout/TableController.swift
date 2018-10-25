//
//  ViewController.swift
//  layout
//
//  Created by Fairy on 2018/10/25.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

class TableController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension TableController : UITableViewDelegate {
    
}

extension TableController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        return cell
    }
    
    
}

