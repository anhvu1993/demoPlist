//
//  Districts.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/25/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import Foundation
class Districts  :Name {
    var cityCode :Int
    var districts:Int
    var name     :String
    init?(dictionary: DICT) {
        guard let cityCode  = dictionary["CityCode"]     as? Int    else {return nil}
        guard let districts = dictionary["DistrictCode"] as? Int    else {return nil}
        guard let name      = dictionary["Name"]         as? String else {return nil}
        self.cityCode       = cityCode
        self.districts      = districts
        self.name           = name
    }
    static func parse (dictionary: DICT ) -> [Districts] {
        
//        cach 1
 /*
        var result = [Districts]()
        guard let listDistrict = dictionary["Districts"] as? [DICT] else {return []}
        for item in listDistrict {
            if let district    = Districts(dictionary: item) {
                result.append(district)
            }
        }
        return result
 */
        
//        cach 2
        guard let listDistrict = dictionary["Districts"] as? [DICT] else {return []}
        return listDistrict.map{Districts(dictionary: $0)!}
    }
}
