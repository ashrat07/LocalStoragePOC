//
//  WKProcessPoolManager.swift
//  LocalStoragePOC
//
//  Created by Ashish Rathore on 02/04/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import WebKit

class WKProcessPoolManager {
    static let shared = WKProcessPoolManager()
    private init() {}
    let sharedProcessPool = WKProcessPool()
}
