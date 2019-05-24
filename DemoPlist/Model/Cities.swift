//
//  Cities.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/25/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import Foundation
protocol Name {
    var name:String {get set}
}
class Cities    : Name {
    var cityCode:Int
    var name    : String
    init?(dictionary: DICT) {
        guard let cityCode = dictionary["CityCode"] as? Int    else {return nil}
        guard let name     = dictionary["Name"]     as? String else {return nil}
        self.cityCode      = cityCode
        self.name          = name
    }
    static func pasre(dictionary: DICT) -> [Cities] {
//        cach 1
        
/*   var result = [Cities]()
        guard let listDistricts = dictionary["Cities"] as? [DICT] else {return []}
                for item in listDistricts {
                    if let city         = Cities(dictionary: item) {
                        result.append(city)
                    }
                }
                return result
*/
        
//        cach 2
        
        guard let listDistricts = dictionary["Cities"] as? [DICT] else {return []}
        return listDistricts.map{Cities(dictionary: $0)!}
    }
    
    
}
