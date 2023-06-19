# MultiLayoutTableview

This image below is very popular in App. In previous i usually separated by Container View or UItableview (need if|else when implement)

<img height="400px" src = "https://github.com/phoenixit99/MultiLayoutTableview/blob/main/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20-%202023-06-19%20at%2010.21.46.png">

Today. i guide a way that implement by UITableview without check if|else .

The idea that define protocol. 

# Define Protocol For Cell implement 
- Define function return height for row
- Function with can arrange Cell in UITableview,UICollectionView 

protocol MultiLayoutProtocol {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func getHeightForRow() -> CGFloat
    
    func getOrder() -> Int
    
}

## How to implement and Show in tableview,CollectionView

--> Create Cell that implement the protocol 

ex: class OneColumnController : MultiLayoutProtocol { } 

class TwoColumnController : MultiLayoutProtocol {} 


# In ViewModel. Add all cell layout type by array MultiLayoutProtocol, 
    
    
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

    func getNumberOfSection() -> Int {
        return listViewLayout.count
    }

    func getLayoutOfViewAtIndexPath(_ indexPath: IndexPath) -> MultiLayoutProtocol {
        guard listViewLayout.count > 0 else { return OneColumnController() }
        return listViewLayout[indexPath.row]
    }
    

## Implement In ViewControler

    
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
   
## Other, More.....
In case arrange UI in UITableview, just set order of Cell 

    
<img height="400px" src = "https://github.com/phoenixit99/MultiLayoutTableview/blob/main/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20-%202023-06-19%20at%2010.21.46.png">

<img height="400px" src = "https://github.com/phoenixit99/MultiLayoutTableview/blob/main/Simulator%20Screenshot%20-%20iPhone%2014%20Pro%20-%202023-06-19%20at%2010.21.48.png">



