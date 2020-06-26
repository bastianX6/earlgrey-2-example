//
//  IntegrationTests.swift
//  ItunesSimpleSearchUITests
//
//  Created by Bastián Véliz Vega on 24-06-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import XCTest

class IntegrationTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCustomLookup() {
        do {
            try self.host.injectLookupDependency(fromJSON: .lookup)
        } catch {
            XCTFail("fail with error: \(String(describing: error))")
        }

        let searchText = "Metallica\n"
        let songName = "Eres Mía"
        let albumName = "Fórmula, Vol. 2 (Deluxe Edition)"
        let artistName = "Romeo Santos"

        // Search
        EarlGrey
            .selectElement(with: grey_accessibilityID(SearchViewIdentifiers.searchbar.id))
            .perform(grey_typeText(searchText))

        // Tap first cell
        EarlGrey
            .selectElement(with: [
                grey_accessibilityID(SearchViewIdentifiers.cell.id),
                grey_interactable()
            ].all())
            .atIndex(0)
            .perform(grey_tap())

        // Verify elements in lookup screen
        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.albumCover.id))
            .assert(grey_sufficientlyVisible())
        EarlGrey
            .selectElement(with: [
                grey_accessibilityID(LookupDetailViewIdentifiers.song.id),
                grey_accessibilityLabel(songName)
            ].all())
            .assert(grey_sufficientlyVisible())
        EarlGrey
            .selectElement(with: [
                grey_accessibilityID(LookupDetailViewIdentifiers.album.id),
                grey_accessibilityLabel(albumName)
            ].all())
            .assert(grey_sufficientlyVisible())

        EarlGrey
            .selectElement(with: [
                grey_accessibilityID(LookupDetailViewIdentifiers.artist.id),
                grey_accessibilityLabel(artistName)
            ].all())
            .assert(grey_sufficientlyVisible())
    }
}

private extension XCTestCase {
    /// A variable to point to the GREYHostApplicationDistantObject since casts in Swift fail on
    /// proxy types. Hence we have to perform an unsafeBitCast.
    var host: SwiftTestHost {
        return unsafeBitCast(
            GREYHostApplicationDistantObject.sharedInstance,
            to: SwiftTestHost.self
        )
    }
}
