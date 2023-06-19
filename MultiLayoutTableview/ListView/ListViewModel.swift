//
//  ListViewModel.swift
//  MultiLayoutTableview
//
//  Created by Hoang Nguyen on 6/18/23.
//

import Foundation


class ListViewModel : NSObject {
    
    private var listViewLayout: [MultiLayoutProtocol] = []
    private let onceColumnLayout = OneColumnController()
    private let twoColumnLayout  = TwoColumnController()
    
    override init() {
        super.init()
        configureLayout()
    }
    
    private func configureLayout() {
        //
        onceColumnLayout.configure(["test once coumn"])
        listViewLayout.append(onceColumnLayout)
        
        twoColumnLayout.configure(["test dummy data"])
        listViewLayout.append(twoColumnLayout)
        
    }
    func setPriorityFirstColumn() {
        onceColumnLayout.setOrder(1)
        twoColumnLayout.setOrder(2)
        listViewLayout.sort { fItem,sItem in
            return fItem.getOrder() < sItem.getOrder()
        }
    }
    func setPrioritySecondColumn() {
        onceColumnLayout.setOrder(2)
        twoColumnLayout.setOrder(1)
        listViewLayout.sort { fItem,sItem in
            return fItem.getOrder() < sItem.getOrder()
        }
    }
    func getNumberOfSection() -> Int {
        return listViewLayout.count
    }
    
    func getLayoutOfViewAtIndexPath(_ indexPath: IndexPath) -> MultiLayoutProtocol {
        guard listViewLayout.count > 0 else { return OneColumnController() }
        return listViewLayout[indexPath.row]
    }
    
}
