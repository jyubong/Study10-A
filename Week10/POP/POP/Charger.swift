//
//  Charger.swift
//  POP
//
//  Created by jyubong on 11/18/23.
//

struct Charger: Chargeable, Portable {
    let maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        if maximumWattPerHour > chargeableWattPerHour {
            return chargeableWattPerHour
        } else {
            return maximumWattPerHour
        }
    }
}
