//
//  SwiftTestHost.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 24-06-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

@objc
protocol SwiftTestHost {
    func injectLookupDependency(fromJSON file: JSONFileName) throws
    func injectLookupDependency(withError error: NSError) throws
}

@objc enum JSONFileName: Int {
    case lookup
    case otherLookup
}

extension JSONFileName {
    var fileName: String {
        switch self {
        case .lookup:
            return "lookup"
        case .otherLookup:
            return "lookup-2"
        }
    }
}
