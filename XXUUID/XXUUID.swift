//
//  XXUUID.swift
//  SqliteDemo
//
//  Created by 朱小祥 on 2017/5/5.
//  Copyright © 2017年 朱小祥. All rights reserved.
//

import UIKit

private let KEY_USERNAME_PASSWORD = "com.shanlin.usernamepassword"

class XXUUID: NSObject {

    //get the uuid of device
    class func getUUID() -> String{
        var strUUID = XXKeyChain.load(service: KEY_USERNAME_PASSWORD)
        if strUUID == nil || strUUID as! String == "" {
            let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
            let strRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
            strUUID = (strRef! as String).replacingOccurrences(of: "-", with: "")
            XXKeyChain.save(service: KEY_USERNAME_PASSWORD, data: strUUID!)
        }
        return strUUID as! String
    }
}
