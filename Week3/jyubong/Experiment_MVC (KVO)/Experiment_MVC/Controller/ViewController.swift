//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class ViewController: UIViewController {
    // View와 연결
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // Model
    var registrantList: [Registrant] = []
    var registrant = Registrant()
    var nameObservation: NSKeyValueObservation?
    var numberObservation: NSKeyValueObservation?
    
    // Controller
    override func viewDidLoad() {
        super.viewDidLoad()
    
        register()
    }
    
    // Controller
    @IBAction func hitRegisterButton(_ sender: Any) {
        let name: String = nameTextField.text ?? ""
        let phoneNumber: String = phoneNumberTextField.text ?? ""
        registrant.name = name
        registrant.phoneNumber = phoneNumber
        
        reset()
    }
    
    // Controller
    @IBAction func hitCheckButton(_ sender: Any) {
        nameLabel.text = registrantList.last?.name
        phoneNumberLabel.text = registrantList.last?.phoneNumber
    }
    
    func register() {
        nameObservation = registrant.observe(\.name, options: [.old, .new]) { registrant, change in
            self.nameLabel.text = change.newValue
        }
        
        numberObservation = registrant.observe(\.phoneNumber, options: [.old, .new]) { registrant, change in
            self.phoneNumberLabel.text = change.newValue
        }
    }
    
    func reset() {
        nameTextField.text = ""
        phoneNumberTextField.text = ""
    }
}
