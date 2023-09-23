//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

//protocol BuyingViewControllerDelegate: AnyObject {
//    func configurePointLabel(_ text: String)
//}

class BuyingViewController: UIViewController {
    
    let pointManager = PointManager.shared
//    weak var delegate: BuyingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Buying - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Buying - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Buying - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Buying - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Buying - viewDidDisappear")
    }
    
    @IBAction func purchaseButtonTapped(_ sender: Any) {
//        pointManager.decreasePoint(by: 50)
//        self.delegate?.configurePointLabel(String(pointManager.point))
//        self.delegate?.configurePointLabel(String(pointManager.point))
//        dismiss(animated: true, completion: nil)
//        self.presentingViewController?.dismiss(animated: true)
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        self.presentingViewController?.dismiss(animated: true)
//        self.navigationController?.popViewController(animated: true)
    }
}
