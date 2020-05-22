//
//  Inject.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 22-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

// code from: https://medium.com/swlh/dependency-injection-in-swift-with-property-wrappers-c1f02f06cd51
@propertyWrapper
struct Inject<T> {
    var component: T

    init() {
        self.component = Resolver.shared.resolve(T.self)
    }

    public var wrappedValue: T {
        get { return self.component }
        mutating set { component = newValue }
    }
}
