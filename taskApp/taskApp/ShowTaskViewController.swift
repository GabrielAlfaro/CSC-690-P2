
import UIKit


//make a protocol and let the first view controller adhere to what is going on
//implementing everything that this view controller does



protocol CheckTaskDelegate: class {//call back
    func switchPressed(_ sender: UISwitch)


    //  var switchStatus: Bool {get set}//look up online
    //pass back information about a task being completed
    //Don't need to pass anything else back, besides maybe saved input strings
}

class ShowTaskViewController: UIViewController {
    //initialized then able to be manipulated
    
    //var switchWasPressedCallBack: (() -> Void)?
    //making an optional call back
    weak var delegate: CheckTaskDelegate?//made a delegate
    
    @IBOutlet weak var outputLabel: UILabel!//label
    
    @IBOutlet weak var userInput: UITextField!//text field
    
    var switchPressed: Bool = false
    
    @IBOutlet weak var mySwitch: UISwitch!//switch outlet to be passed to other VC
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let userNotes = userInput.text else {
            return
        }
        
        //put string into variable
        
        
        
        let vc1 = TaskTableViewController()
        
        vc1.inputForEachCell.append(userNotes)
        //tableView.reloadData()
        outputLabel.text = userNotes
        UserDefaults.standard.set(userNotes, forKey: "userNotes")

        
       // vc1.tableView(UITableView, cellForRowAt: IndexPath) = userNotes

       //UserDefaults.standard.set(vc1.inputForEachCell, forKey: "userNotes")

        //vc1.inputForEachCell[]//print string out
        
        
    }
    //and call the tableiew functions
    //problems:
    //Protocol? for didSelectRowAt?
    //need to connect the string input with the correct cell
    //need to connect the switchButton with the correct cell

    //var switchButton: checkTaskAsCompleted?//switchButton of type checkTaskAsCompleted Optional
    
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        delegate?.switchPressed(sender)//send the action to the first
        //view controller
        
        if(sender.isOn == true){
            print("Button On")
            switchPressed = true
           // mySwitch.isOn = true
       //     switchChanged = true
        }else{
            print("Button Off")
            switchPressed = false
        //    switchChanged = false
        }

        
        UserDefaults.standard.set(switchPressed, forKey: "switchStatus")
        //sender is of type UISwitch
        //checkPointer.tableView.cellForRow(at: IndexPath.)
        //checkPointer.tableView.
        
        //turn switch on if pressed
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()//
        switchPressed = false
      //  mySwitch.isOn = false//setting to false then updating state
        mySwitch.isOn = UserDefaults.standard.bool(forKey: "switchStatus")
        outputLabel.text = UserDefaults.standard.string(forKey: "userNotes")
        
        
   //dont need anything loaded right away
    
    }
    

    
    
}
