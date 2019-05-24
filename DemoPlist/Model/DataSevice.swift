//
//  DataSevice.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/25/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import Foundation
typealias DICT = Dictionary<AnyHashable, Any>
class DataSevice {
    static var shared = DataSevice()
    
    lazy var dataCities:[Cities]       = {
        return getData(fileName: "Cities", parseData: Cities.pasre)
        
    }()
    lazy var dataDistricts:[Districts] = {
        return getData(fileName: "Districts", parseData: Districts.parse)
    }()
//     loc dữ liệu
    var selecteDistricts: [Districts]  = []
    var selecterCity: Cities? {
        didSet {
            if selecterCity     != nil {
                selecteDistricts = dataDistricts.filter{ $0.cityCode == selecterCity!.cityCode }
            }
        }
    }
    func getData<T> (fileName: String, parseData: (DICT) -> [T]) -> [T] {
        var result: [T] = []
//        đường dẩn file plist
        guard let plistPath = Bundle.main.path(forResource: fileName, ofType: "plist") else {return[]}
//        đọc nội dung
        guard let plistData = FileManager.default.contents(atPath: plistPath) else {return[]}
        do {
//            lấy dữ liệu
            guard let plistDic = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil) as? DICT else {return []}
//            xem lấy đc dữ liệu hay không
//            print(plistDic)
            result = parseData(plistDic)
        } catch {
            print("error")
        }
        return result
    }
}
