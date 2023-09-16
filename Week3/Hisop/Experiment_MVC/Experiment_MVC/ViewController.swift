//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = [] //Modal
    
    @objc func nameChanged(_ noti: NSNotification) {
        nameLabel.text = nameTextField.text
        phoneNumberLabel.text = phoneNumberTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(nameChanged(_:)), name: Notification.Name("changeLabel"), object: nil)
        // Do any additional setup after loading the view.
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        //register()
        NotificationCenter.default.post(name: Notification.Name("changeLabel"), object: nil)
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        
    }
    
    func register() { //controller
        nameLabel.text = nameTextField.text
        phoneNumberLabel.text = phoneNumberTextField.text
    }
}
