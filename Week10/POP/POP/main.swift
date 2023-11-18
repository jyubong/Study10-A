//
//  main.swift
//  POP
//
//  Created by Hisop on 2023/11/18.
//

let appleWatchCharger = Charger(maximumWattPerHour: 5)
let iPhoneCharger = Charger(maximumWattPerHour: 18)
let iPadCharger = Charger(maximumWattPerHour: 30)
let macBookCharger = Charger(maximumWattPerHour: 96)
let macBookFasterCharger = Charger(maximumWattPerHour: 106)

var macBook = MacBook(allowableWattPerHour: 50, currentBatteryCapacity: 20)
//macBook.chargeBattery(charger: appleWatchCharger)
macBook.chargeBattery(charger: macBookCharger)

var handBag = Bag()
handBag.put(item: macBook)
handBag.put(item: macBookCharger)
