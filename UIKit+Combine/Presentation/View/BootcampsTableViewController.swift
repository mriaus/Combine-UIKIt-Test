//
//  BootcampsTableViewController.swift
//  UIKit+Combine
//
//  Created by Marcos on 3/11/23.
//

import UIKit
import Combine

class BootcampsTableViewController: UITableViewController {
    
    let viewModel: ViewModelBootcamps
    var suscriptor = Set<AnyCancellable>()

    init(viewModel: ViewModelBootcamps = ViewModelBootcamps(useCase: CaseUseBootCamp())) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        viewModel.getBootcamps()
            .sink(receiveCompletion: { completion in
                print("ok")
            }, receiveValue: { data in
                print("Mete los datos")
                self.viewModel.bootcamps = data
                self.tableView.reloadData()
            })
            .store(in: &suscriptor)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.bootcamps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = viewModel.bootcamps[indexPath.row].name

        return cell
    }
    

}
