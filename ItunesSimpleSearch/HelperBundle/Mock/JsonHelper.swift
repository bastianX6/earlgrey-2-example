//
//  JsonHelper.swift
//  HelperBundle
//
//  Created by Bastián Véliz Vega on 24-06-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

public enum JSONHelper {
    static let bundleId = "bastianx6.HelperBundle"

    public static func loadJSON<Element: Decodable>(withFile fileName: String) -> Element? {
        var jsonData: Element?

        if let url = Bundle(identifier: self.bundleId)?.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(Element.self, from: data)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return jsonData
    }
}
