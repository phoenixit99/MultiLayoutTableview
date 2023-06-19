//
//  OneColumnController.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import Foundation
import UIKit

class TwoColumnController : MultiLayoutProtocol {
    
    private var data: [String] = []
    private var orderId: Int = 2
    
    static func injectCell(tableView: UITableView) {
        tableView.register(TwoColumnCell.cellIdentifier)
    }
    
    func configure(_ data: [String]) {
        self.data = data
    }
    func setOrder(_ orderId: Int) {
        self.orderId = orderId
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TwoColumnCell.cellIdentifier) as? TwoColumnCell
        else { return UITableViewCell() }
        return cell
    }
    
    func getHeightForRow() -> CGFloat {
        return 300.0
    }
    
    func getOrder() -> Int {
        return orderId
    }
    
}
