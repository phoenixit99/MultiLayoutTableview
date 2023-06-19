//
//  OneColumnController.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import Foundation
import UIKit

class OneColumnController : MultiLayoutProtocol {
    
    private var data: [String] = []
    private var orderId: Int = 1

    static func injectCell(tableView: UITableView) {
        tableView.register(OneColumnCell.cellIdentifier)
    }
    
    func configure(_ data: [String]) {
        self.data = data
    }
    func setOrder(_ orderId: Int) {
        self.orderId = orderId
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OneColumnCell.cellIdentifier) as? OneColumnCell
        else { return UITableViewCell() }
        return cell
    }
    
    func getHeightForRow() -> CGFloat {
        return 150.0
    }
    
    func getOrder() -> Int {
        return orderId
    }
}
