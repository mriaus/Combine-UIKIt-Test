//
//  ViewController.swift
//  UIKit+Combine
//
//  Created by Marcos on 3/11/23.
//

import UIKit

protocol ViewControllerDelegate {
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loadBootCamps(_ sender: Any) {
        print("Entra")
        let vc = BootcampsTableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ViewControllerDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}


