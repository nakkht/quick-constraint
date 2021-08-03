//
// Copyright 2020 Paulius Gudonis
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

public extension StackView {

    #if os(iOS) || os(tvOS)
    /// Convenience initializer for simple `UIStackView`.
    /// - Parameters:
    ///   - axis: `StackAxis` value specifying a horizontal or vertical layout constraint.
    ///   - alignment: Alignment—the layout transverse to the stacking axis. Defaults to `.fill`.
    ///   - distribution: Value describing the content layout along the stacking axis rules in `UIStackView`. Defaults to `.fill`.
    ///   - spacing: Spacing beween content items in `UIStackView`. Defaults to 0.0
    convenience init(axis: StackAxis, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.axis = axis
    }

    #else

    /// Convenience initializer for simple `NSStackView`.
    /// - Parameters:
    ///   - axis: `NSUserInterfaceLayoutOrientation` value specifying a horizontal or vertical layout constraint.
    ///   - alignment: Alignment—the layout transverse to the stacking axis.
    ///   - distribution: Value describing the content layout along the stacking axis rules in `NSStackView`. Defaults to `.fill`.
    ///   - spacing: Spacing beween content items in `UIStackView`. Defaults to 0.0
    convenience init(axis: StackAxis, alignment: Alignment, distribution: Distribution = .fill, spacing: CGFloat = 0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.orientation = axis
    }
    #endif

    /// Convenience function to add array of views to `StackView`. Order in which views added to `StackView` is the same as in provided array.
    /// - Parameter arrangedSubviews: Array of views to be added to `StackView`.
    @inline(__always)
    func addArrangedSubviews(_ arrangedSubviews: [View]) {
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }

    /// Convenience function to add number of views  to `StackView`. Order in which views added to `StackView` is the same as in provided array.
    /// - Parameter arrangedSubviews: Variadic parameter of `View` arguments.
    @inline(__always)
    func addArrangedSubviews(_ arrangedSubviews: View...) {
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
}
