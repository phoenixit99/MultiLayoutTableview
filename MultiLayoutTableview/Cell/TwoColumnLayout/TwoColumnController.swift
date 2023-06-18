//
//  OneColumnController.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import Foundation
import UIKit

class TwoColumnController : MultiLayoutProtocol {
    
    static func configure(tableView: UITableView) {
        tableView.register(
            UINib(
                nibName: TwoColumnCell.cellIdentifier,
                bundle: Bundle.main
            ),
            forCellReuseIdentifier: TwoColumnCell.cellIdentifier
        )
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TwoColumnCell.cellIdentifier) as? TwoColumnCell
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
