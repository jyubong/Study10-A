//
//  Registrant.swift
//  Experiment_MVC
//
//  Created by 김진주 on 2023/09/15.
//

import Foundation

struct Registrant {
    var name: String
    var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber

        notifyRegistrantInfoChanged()
    }

    private func notifyRegistrantInfoChanged() {
        NotificationCenter.default.post(name: Notification.Name("registrantInfoChanged"), object: nil, userInfo: ["name": name, "phoneNumber": phoneNumber])
    }
}
