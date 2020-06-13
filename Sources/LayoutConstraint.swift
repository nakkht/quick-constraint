//
// Copyright 2020 Paulius Gudonis, neqsoft
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//  

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// Typealias for `NSLayoutConstraint`
public typealias LayoutConstraint = NSLayoutConstraint

/// Extensions for making operations on `NSLayoutConstraint` less vebose
extension LayoutConstraint {
    
    /// Sets `isActive` property to true and returns the constraint
    open var activated: LayoutConstraint {
        self.isActive = true
        return self
    }
    
    /// Sets `isActive` property to false and returns the constraint
    open var deactivated: LayoutConstraint {
        self.isActive = false
        return self
    }
}
