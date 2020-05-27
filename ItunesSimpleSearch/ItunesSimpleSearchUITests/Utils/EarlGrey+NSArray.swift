//
//  EarlGrey+NSArray.swift
//  ItunesSimpleSearchUITests
//
//  Created by Bastián Véliz Vega on 24-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

// code from: https://github.com/google/EarlGrey/issues/1262#issuecomment-618797346

extension Sequence where Element == GREYMatcher {
    /// Use this instead of grey_allOf.
    /// Ex: [grey_accessibilityId(...), grey_buttonTitle(...)].all()
    /// - Returns: grey_allOf matcher
    func all() -> GREYMatcher {
        let m: [GREYMatcher] = self.map { $0 }
        // https://github.com/google/EarlGrey/issues/1262
        // swiftlint:disable:next force_cast
        return grey_allOf(NSArray(array: m) as! [GREYMatcher])
    }

    
    /// Use this instead of grey_anyOf.
    /// Ex: [grey_accessibilityId(...), grey_buttonTitle(...)].any()
    /// - Returns:grey_anyOf matcher
    func any() -> GREYMatcher {
        let m: [GREYMatcher] = self.map { $0 }
        // https://github.com/google/EarlGrey/issues/1262
        // swiftlint:disable:next force_cast
        return grey_anyOf(NSArray(array: m) as! [GREYMatcher])
    }
}
