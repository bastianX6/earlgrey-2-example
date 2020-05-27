//
//  SearchTests.swift
//  ItunesSimpleSearchUITests
//
//  Created by Bastián Véliz Vega on 24-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import XCTest

class SearchTests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        self.app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInternetSearch() {
        let searchText = "Metallica\n"

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
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.song.id))
            .assert(grey_sufficientlyVisible())
        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.album.id))
            .assert(grey_sufficientlyVisible())

        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.artist.id))
            .assert(grey_sufficientlyVisible())
    }

    func testInternetSearch2() {
        let searchText = "31 minutos\n"
        let cellLabelText = "El Señor Interesante"
        let halfScreenSize: CGFloat = UIScreen.main.bounds.height / 2

        // Search
        EarlGrey
            .selectElement(with: grey_accessibilityID(SearchViewIdentifiers.searchbar.id))
            .perform(grey_typeText(searchText))

        // Select specific cell

        EarlGrey
            .selectElement(with: [
                grey_accessibilityLabel(cellLabelText),
                grey_sufficientlyVisible()
            ].all())
            .usingSearch(action: grey_scrollInDirection(.down, halfScreenSize),
                         onElementWith: grey_kindOfClassName("UITableView"))
            .perform(grey_tap())

        // Verify elements in lookup screen

        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.albumCover.id))
            .assert(grey_sufficientlyVisible())
        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.song.id))
            .assert(grey_sufficientlyVisible())
        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.album.id))
            .assert(grey_sufficientlyVisible())

        EarlGrey
            .selectElement(with: grey_accessibilityID(LookupDetailViewIdentifiers.artist.id))
            .assert(grey_sufficientlyVisible())
    }
}
