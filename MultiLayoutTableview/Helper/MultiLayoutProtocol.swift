//
//  MultiLayoutProtocol.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import UIKit

protocol MultiLayoutProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    
    func getHeightForRow() -> CGFloat
    
    func getOrder() -> Int
    
    func getId() -> String
    
    func getSection() -> String
    
}
