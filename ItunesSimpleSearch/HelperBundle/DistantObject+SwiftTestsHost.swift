//
//  DistantObject+SwiftTestsHost.swift
//  HelperBundle
//
//  Created by Bastián Véliz Vega on 24-06-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation
@testable import ItunesSimpleSearch

extension GREYHostApplicationDistantObject: SwiftTestHost {
    func injectLookupDependency(withError error: NSError) throws {
        let repository = MockLookupRepository(error: error)
        Resolver.shared.add(type: LookupRepositoryProtocol.self) { repository }
    }

    func injectLookupDependency(fromJSON file: JSONFileName) throws {
        let repository = MockLookupRepository(jsonFile: file.fileName)
        Resolver.shared.add(type: LookupRepositoryProtocol.self) { repository }
    }
}
