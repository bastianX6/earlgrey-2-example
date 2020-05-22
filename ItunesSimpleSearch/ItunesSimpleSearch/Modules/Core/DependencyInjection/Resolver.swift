//
//  Resolver.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 22-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

// code from: https://medium.com/swlh/dependency-injection-in-swift-with-property-wrappers-c1f02f06cd51
class Resolver {
    static let shared = Resolver()
    var factoryDict: [String: () -> Component] = [:]

    func add<T>(type: T.Type, _ factory: @escaping () -> Component) {
        self.factoryDict[String(describing: type.self)] = factory
    }

    func resolve<T>(_ type: T.Type) -> T {
        guard let component = self.factoryDict[String(describing: type.self)]?() as? T else {
            fatalError("Component \(String(describing: type)) is not present")
        }
        return component
    }
}
