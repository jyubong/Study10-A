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
    
    // Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
    }
    
    // Controller
    @IBAction func hitRegisterButton(_ sender: Any) {
        let name: String = nameTextField.text ?? ""
        let phoneNumber: String = phoneNumberTextField.text ?? ""
        let registrant = Registrant(name: name, phoneNumber: phoneNumber)
        
        registrantList.append(registrant)
        
        reset()
    }
    
    // Controller
    @IBAction func hitCheckButton(_ sender: Any) {
        nameLabel.text = registrantList.last?.name
        phoneNumberLabel.text = registrantList.last?.phoneNumber
    }
    
    func register() {
        NotificationCenter.default.addObserver(self, selector: #selector(didRegistrantInfoChanged(_:)), name: Notification.Name("registrantInfoChanged"), object: nil)
    }
    
    func reset() {
        nameTextField.text = ""
        phoneNumberTextField.text = ""
    }
    
    @objc func didRegistrantInfoChanged(_ noti: NSNotification) {
        guard let changedName = noti.userInfo?["name"] as? String, let changedNumber = noti.userInfo?["phoneNumber"] as? String else { return }
        
        nameLabel.text = changedName
        phoneNumberLabel.text = changedNumber
    }
}
