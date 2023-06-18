//
//  ListViewModel.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import Foundation


class ListViewModel : NSObject {
    
    private var listViewLayout: [MultiLayoutProtocol] = []
    private let onceColumnLayout: MultiLayoutProtocol = OneColumnController()
    private let twoColumnLayout: MultiLayoutProtocol  = TwoColumnController()
    
    override init() {
        super.init()
        configureLayout()
    }
    
    private func configureLayout() {
        //
        listViewLayout.append(contentsOf: [onceColumnLayout,twoColumnLayout])
    }
    
    func getNumberOfSection() -> Int {
        return listViewLayout.count
    }
    
    func getLayoutOfViewAtIndexPath(_ indexPath: IndexPath) -> MultiLayoutProtocol {
        guard listViewLayout.count > 0 else { return OneColumnController() }
        return listViewLayout[indexPath.row]
    }
    
}
