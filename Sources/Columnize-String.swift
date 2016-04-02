//
//  Columnize-String.swift
//  Columnize
//
//  Created by Andrew McKnight on 4/2/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import Foundation
import LeftPad
import Truncate

// abridged signatures that call through with defaults
public extension String {

    /// truncation side defaults to right, truncation indicator defaults to no indication (nil), padding string defaults to LeftPad default (pass nil)

    public func columnize(toWidth width: Int) -> String {
        return columnize(toWidth: width, withString: nil)
    }

    public func columnize(toWidth width: Int, truncatingFromSide truncationSide: TruncationSide) -> String {
        return columnize(toWidth: width, truncatingFromSide: truncationSide, truncationIndicator: nil)
    }

    public func columnize(toWidth width: Int, truncationIndicator: String?) -> String {
        return columnize(toWidth: width, truncatingFromSide: defaultTruncationSide, truncationIndicator: truncationIndicator)
    }

    public func columnize(toWidth width: Int, withString string: String?) -> String {
        return columnize(toWidth: width, withString: string, truncatingFromSide: defaultTruncationSide)
    }

    public func columnize(toWidth width: Int, withString string: String?, truncationIndicator: String?) -> String {
        return columnize(toWidth: width, withString: string, truncatingFromSide: defaultTruncationSide, truncationIndicator: truncationIndicator)
    }

    public func columnize(toWidth width: Int, truncatingFromSide truncationSide: TruncationSide, truncationIndicator: String?) -> String {
        return columnize(toWidth: width, withString: nil, truncatingFromSide: truncationSide, truncationIndicator: truncationIndicator)
    }

    public func columnize(toWidth width: Int, withString string: String?, truncatingFromSide truncationSide: TruncationSide) -> String {
        return columnize(toWidth: width, withString: string, truncatingFromSide: truncationSide, truncationIndicator: nil)
    }

}

public extension String {

    public func columnize(toWidth width: Int, withString string: String?, truncatingFromSide truncationSide: TruncationSide, truncationIndicator: String?) -> String {
		if width > self.characters.count {
			return self.leftPad(toWidth: width, withString: string)	
		}

        if width < self.characters.count {
            return self.truncate(toLength: width, truncatingFromSide: truncationSide, truncationIndicator: truncationIndicator)
        }

        return self
    }

}
