//
//  ColumnizeTests.swift
//  ColumnizeTests
//
//  Created by Andrew McKnight on 4/2/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import XCTest
@testable import Columnize

class ColumnizeTests: XCTestCase {

    func testColumnizeAllDefaults() {
        for (input, expectedOutput) in [
            "abc"           : "       abc",
            "abcdefghijk"   : "abcdefghij"
            ] {
                let computedOutput = input.columnize(toWidth: 10)
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeWithTruncationIndicator() {
        for (input, expectedOutput) in [
            "abc"           : "       abc",
            "abcdefghijk"   : "abcdefghi…"
            ] {
                let computedOutput = input.columnize(toWidth: 10, truncationIndicator: "…")
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeAlternateTruncationSide() {
        for (input, expectedOutput) in [
            "abc"           : "       abc",
            "abcdefghijk"   : "bcdefghijk"
            ] {
                let computedOutput = input.columnize(toWidth: 10, truncatingFromSide: .Left)
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeAlternateTruncationSideWithIndicator() {
        for (input, expectedOutput) in [
            "abc"           : "       abc",
            "abcdefghijk"   : "…cdefghijk"
            ] {
                let computedOutput = input.columnize(toWidth: 10, truncatingFromSide: .Left, truncationIndicator: "…")
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeAlternatePadString() {
        for (input, expectedOutput) in [
            "abc"           : "%%%%%%%abc",
            "abcdefghijk"   : "abcdefghij"
            ] {
                let computedOutput = input.columnize(toWidth: 10, withString: "%")
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeAlternatePadStringWithTruncationIndicator() {
        for (input, expectedOutput) in [
            "abc"           : "%%%%%%%abc",
            "abcdefghijk"   : "abcdefghi…"
            ] {
                let computedOutput = input.columnize(toWidth: 10, withString: "%", truncationIndicator: "…")
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeAlternatePadStringAndTruncationSide() {
        for (input, expectedOutput) in [
            "abc"           : "%%%%%%%abc",
            "abcdefghijk"   : "bcdefghijk"
            ] {
                let computedOutput = input.columnize(toWidth: 10, withString: "%", truncatingFromSide: .Left)
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }

    func testColumnizeAlternatePadStringAndTruncationSideWithIndicator() {
        for (input, expectedOutput) in [
            "abc"           : "%%%%%%%abc",
            "abcdefghijk"   : "…cdefghijk"
            ] {
                let computedOutput = input.columnize(toWidth: 10, withString: "%", truncatingFromSide: .Left, truncationIndicator: "…")
                XCTAssert(computedOutput == expectedOutput, "expected \(expectedOutput) but got \(computedOutput)")
        }
    }
    
}
