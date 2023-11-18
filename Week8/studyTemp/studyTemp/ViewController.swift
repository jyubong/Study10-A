//
//  ViewController.swift
//  studyTemp
//
//  Created by Hisop on 2023/11/04.
//

import UIKit

class ViewController: UIViewController {
    enum FoodType: String, CaseIterable {
        case American
        case Chinese
        case Korean
        case Japanese
    }

    struct Food {
        let name: String
        var price: Int
    }
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return FoodType.allCases[section].rawValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return FoodType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = menu[FoodType.allCases[section]]?.count else {
            return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        
        cell.testImage.image = UIImage(systemName: "circle")
        guard let menuName = menu[FoodType.allCases[indexPath.section]]?[indexPath.row].name else {
            return UITableViewCell()
        }
        cell.testLabel.text = menuName
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuName = menu[FoodType.allCases[indexPath.section]]?[indexPath.row].name else {
            return
        }
        guard let menuPrice = menu[FoodType.allCases[indexPath.section]]?[indexPath.row].price else {
            return
        }
        
        let alert = UIAlertController(title: menuName, message: "가격 : \(menuPrice)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

