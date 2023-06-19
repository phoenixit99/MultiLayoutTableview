//
//  UITableView+Extensions.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import UIKit

public extension UITableView {
    
    func register(_ nibName: String, reuseIdentifier: String = "") {
        var identifier = reuseIdentifier
        if identifier.isEmpty {
            identifier = nibName
        }
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }
}
