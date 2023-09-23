//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()
    private(set) var point: Int = 50
    
    private init() { }
    
    func decreasePoint(by count: Int) {
        guard point >= count else { return }
        point -= count
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var pointLabel: UILabel!
    
    let pointManager = PointManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main - viewDidLoad")
        
        configuerUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Main - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Main - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Main - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Main - viewDidDisappear")
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
//        configuerUI()
    }
    
    private func configuerUI() {
        pointLabel.text = String(pointManager.point)
    }
    
    
    @IBAction func presentButtonTapped(_ sender: Any) {
        guard let buyingViewController = self.storyboard?.instantiateViewController(
            withIdentifier: "BuyingViewController"
        ) as? BuyingViewController else {
            return
        }
        
//        buyingViewController.delegate = self
//        buyingViewController.modalPresentationStyle = .fullScreen
//        self.present(buyingViewController, animated: true)
//        self.navigationController?.pushViewController(buyingViewController, animated: true)
    }
}

//extension MainViewController: BuyingViewControllerDelegate {
//    func configurePointLabel(_ text: String) {
//        pointLabel.text = text
//    }
//}
