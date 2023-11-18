//
//  MacBook.swift
//  POP
//
//  Created by Hisop on 2023/11/18.
//

struct MacBook: Portable {
    var allowableWattPerHour: WattPerHour
    var maxBattertyCapacity: WattPerHour = 100
    var currentBatteryCapacity: WattPerHour
    
    mutating func chargeBattery(charger: Chargeable) {
        var time = 0
        let chargeAmountPerSession = charger.convert(chargeableWattPerHour: allowableWattPerHour)
        
        while currentBatteryCapacity < maxBattertyCapacity {
            currentBatteryCapacity += chargeAmountPerSession
            time += 1
            print("current = \(currentBatteryCapacity)")
        }
        
        currentBatteryCapacity = maxBattertyCapacity
        
        print("총 충전시간 : \(time)")
    }
}
