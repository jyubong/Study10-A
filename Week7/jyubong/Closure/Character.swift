//
//  Character.swift
//  Closure
//
//  Created by jyubong on 10/13/23.
//

struct Character {
    let attack: () -> Void = {
        print("내 검을 받아랏!!!")
    }
    
    let heal: () -> Void = {
        print("hp를 회복하였습니다.")
    }
    
    let shield: () -> Void = {
        print("방어막 생성 짜란")
    }
    
    let specialMove: () -> Void = {
        print("필살기 공격이다")
    }
    
    func tabShiftKey(skill: () -> Void) {
        skill()
    }
}
