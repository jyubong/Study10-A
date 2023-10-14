//
//  HigherOrderFunction.swift
//  Closure
//
//  Created by jyubong on 10/13/23.
//

extension Array {
    func myMap(_ transform: (Element) -> Element) -> Self {
        var result: [Element] = []
        
        for item in self {
            result.append(transform(item))
        }
        
        return result
    }
    
    func myFilter(_ transform: (Element) -> Bool) -> Self {
        var result: [Element] = []
        
        for item in self {
            if transform(item) {
                result.append(item)
            }
        }
        
        return result
    }
    
    func myReduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Self.Element) -> Result) -> Result {
        var result: Result = initialResult
        
        for item in self {
            result = nextPartialResult(result, item)
        }
        
        return result
    }
}
