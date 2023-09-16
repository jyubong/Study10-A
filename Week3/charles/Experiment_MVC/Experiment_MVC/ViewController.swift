//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    let name: String
    let contactNumber: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(register), name: Notification.Name("register"), object: nil)
    }
    
    @IBAction func hitRegisterButton(_ sender: Any) {
        
        let registrant = Registrant(name: nameTextField.text!, contactNumber: phoneNumberTextField.text!)
        
        registrantList.append(registrant)
        
        nameLabel.text = registrant.name
        phoneNumberLabel.text = registrant.contactNumber
        
        nameTextField.text = ""
        phoneNumberTextField.text = ""
        
        NotificationCenter.default.post(name: Notification.Name("register"), object: nil)
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
//        let information = registrantList.last
//
//        nameLabel.text = information?.name
//        phoneNumberLabel.text = information?.contactNumber
    }
    
    @objc func register() {
        let information = registrantList.last

        nameLabel.text = information?.name
        phoneNumberLabel.text = information?.contactNumber
    }
}
