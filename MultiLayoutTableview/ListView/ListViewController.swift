//
//  ViewController.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tbListView: UITableView!
    private var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OneColumnController.injectCell(tableView: tbListView)
        TwoColumnController.injectCell(tableView: tbListView)
        
        tbListView.delegate = self
        tbListView.dataSource = self
        tbListView.reloadData()
    }
    
    @IBAction func simpleCellAction(_ sender: Any) {
        viewModel.setPriorityFirstColumn()
        tbListView.reloadData()
    }
    
    @IBAction func complexCellAction(_ sender: Any) {
        viewModel.setPrioritySecondColumn()
        tbListView.reloadData()
    }
}

extension ListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let layoutView =  viewModel.getLayoutOfViewAtIndexPath(indexPath)
        return layoutView.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let layoutView =  viewModel.getLayoutOfViewAtIndexPath(indexPath)
        return layoutView.getHeightForRow()
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Todo
    }
}

