
import UIKit
//working with UI/View Controller





//global variable

class TaskTableViewController: UITableViewController ,CheckTaskDelegate{
    //inherits UITableViewDataSource
    
    var switchStatus = false//change when other view controller is caled
    //initialized
    var selected: String?
    
    func switchPressed(_ sender: UISwitch) {
        if(sender.isOn){
            switchStatus = true
        }else{
            switchStatus = false
        }
        UserDefaults.standard.set(switchStatus, forKey: "switchChanging")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       switchStatus = UserDefaults.standard.bool(forKey: "switchStatus")
        
        //this will hopefully keep the status once the row is marked as completed and saved
        //callback for switchPressed, set the switchStatus to true or false if already true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)//purpose of method is to communicate changes to the screens

        switchStatus = UserDefaults.standard.bool(forKey: "switchChanging")
        //tableView.cellForRow(indexPath)
        //tableView(UITableView, didSelectRowAt: IndexPath)
      //  switchStatus = UserDefaults.standard.bool(forKey: "switchStatus")
    }
    

    var tasks: [String] = ["Notes", "More Notes"]

    var inputForEachCell: [String] = []//make an empty string array that keeps all user input
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count//return rows for each task
    }
    
    //data source delegate method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell2 = UITableViewCell()
        //2cell.textLabel?.text = myData[indexPath.row]
        //return cell
        //save the string to each cell ^?
        
        let task = tasks[indexPath.row]
        //delegte method gets access to the table view
        //unique identifier for prototype cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell")!
        //way of re-using cells
        cell.textLabel?.text = task
        //cell has textlabel, assigning task string to text
        
        return cell
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        //add tasks button
        tasks.append("Even More Notes")
        tableView.reloadData()
        //reloads rows and sections of table view
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //view letting view controller know its being selected
       // print(tasks[indexPath.row])
        selected = tasks[indexPath.row]
        performSegue(withIdentifier: "taskTransition", sender: self)//reference ShowTaskViewController
        //then instantiate it
        if((UserDefaults.standard.bool(forKey: "switchChanging")) == true){
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        //works in the sense that the checkmark will appear after the you checkmarked the task then entered again
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let switchDestination = segue.destination as? ShowTaskViewController/*, let showTVC = switchDestination.delegate*/{
            switchDestination.delegate = self
            
            switchStatus = UserDefaults.standard.bool(forKey: "switchState")
            //does it get the status of the boolean value of switch
            
           //  switchDestination.task = selected
            
        }
    }

    
}
