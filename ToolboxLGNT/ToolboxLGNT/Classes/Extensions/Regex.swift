//
//  Regex.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import Foundation

public extension String {
    public func matches(for pattern: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return [] }
        let range = NSRange(startIndex..., in: self)
        let results = regex.matches(in: self, range: range)
        return results.flatMap { Range($0.range, in: self).map { String(self[$0]) } }
    }
}
