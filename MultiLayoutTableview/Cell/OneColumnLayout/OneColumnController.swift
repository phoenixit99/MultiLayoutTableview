//
//  OneColumnController.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import Foundation
import UIKit

class OneColumnController : MultiLayoutProtocol {
    
    static func configure(tableView: UITableView) {
        tableView.register(
            UINib(
                nibName: OneColumnCell.cellIdentifier,
                bundle: Bundle.main
            ),
            forCellReuseIdentifier: OneColumnCell.cellIdentifier
        )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OneColumnCell.cellIdentifier) as? OneColumnCell
        else { return UITableViewCell() }
        return cell
    }
    
    func getHeightForRow() -> CGFloat {
        return 50.0
    }
    
    func getOrder() -> Int {
        return 1
    }
    func getId() -> String {
        return ""
    }
    
    func getSection() -> String {
        return "0"
    }
}
