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

/// Provides convienience methods for using auto layout and constraining view to the parent
public extension View {
    
    /// Creates the most basic and common constraints dedicated for constraining to 4 anchors of the parent veiw: top -> top, bottom -> bottom. leading -> leading, trailing -> trailing
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - anchor: anchor type to be used for determining which constraints to generate. Defaults to `all` and generates constaints to all 4 sides,`
    ///   - margin: number  to be used as a constant for generated constraints. Same value applied to all generated constraints if there are multiple
    /// - Returns: generated  active constraints
    @inline(__always)
    @discardableResult
    func pin(to view: View, anchor: Anchor = .all, margin: CGFloat = 0) -> [NSLayoutConstraint] {
        #if os(iOS) || os(tvOS)
        if #available(iOS 11.0, tvOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchor: anchor, margin: margin)
        } else {
            return pin(toGuide: view, anchor: anchor, margin: margin)
        }
        #else
        return pin(toGuide: view, anchor: anchor, margin: margin)
        #endif
    }
    
    /// Convenience function for creating constraints while utilizing Margin enum
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - anchor: anchor type to be used for determining which constraints to generate. Defaults to `all` and generates constaints to all 4 sides,`
    ///   - margin: number  to be used as a constant for generated constraints. Same value applied to all generated constraints if there are multiple. Will automatically handle conversion to CGFloat
    /// - Returns: generated  active constraints
    @inline(__always)
    @discardableResult
    func pin(to view: View, anchor: Anchor = .all, margin: Margin = .int(0)) -> [NSLayoutConstraint] {
        return self.pin(to: view, anchor: anchor, margin: margin.value)
    }
    
    /// Creates opposite constraints: source top anchor to bottom anchor of the target view
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - margin: number of points to be used for generating margin for the view
    /// - Returns: generated active constraints
    @inline(__always)
    @discardableResult
    func pinTopToBottom(of view: View, margin: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: margin)
        constraint.isActive = true
        return constraint
    }
    
    /// Creates opposite constraints: source bottom anchor to top anchor of the target view
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - margin: number of points to be used for generating margin for the view
    /// - Returns: generated active constraints
    @inline(__always)
    @discardableResult
    func pinBottomToTop(of view: View, margin: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: -margin)
        constraint.isActive = true
        return constraint
    }
    
    /// Creates opposite constraints: source leading anchor to trailing anchor of the target view
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - margin: number of points to be used for generating margin for the view
    /// - Returns: generated active constraints
    @inline(__always)
    @discardableResult
    func pinLeadingToTrailing(of view: View, margin: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: margin)
        constraint.isActive = true
        return constraint
    }
    
    /// Creates opposite constraints: source trailing anchor to leading anchor of the target view
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - margin: number of points to be used for generating margin for the view
    /// - Returns: generated active constraints
    @inline(__always)
    @discardableResult
    func pinTrailingToLeading(of view: View, margin: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -margin)
        constraint.isActive = true
        return constraint
    }
    
    private func pin(toGuide guide: AnyObject, anchor: Anchor = .all, margin: CGFloat) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        if anchor.isTop { constraints.append(topAnchor.constraint(equalTo: guide.topAnchor, constant: margin)) }
        if anchor.isBottom { constraints.append(bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin)) }
        if anchor.isLeading { constraints.append(leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin)) }
        if anchor.isTrailing { constraints.append(trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin)) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    /// Creates constraints for width/height dimensions with specified size
    /// - Parameters:
    ///   - dimension: dimension type to be used for determining which constraints to generate. Use `all` to generate width and height constraints simultaneously
    ///   - value: size of set dimensions
    /// - Returns: generated active constraints
    @inline(__always)
    @discardableResult
    func set(_ dimension: Dimension, _ value: CGFloat) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        if dimension.isWidth { constraints.append(widthAnchor.constraint(equalToConstant: value)) }
        if dimension.isHeight { constraints.append(heightAnchor.constraint(equalToConstant: value)) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    /// Creates constraints based on center x and y axis
    /// - Parameters:
    ///   - view: target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy
    ///   - axis: axis type to be used for determining which constraints to generate. Use `all` to generate center constraints for x and y axis simultaneously
    /// - Returns: generated active constraints
    @inline(__always)
    @discardableResult
    func center(to view: View, axis: Axis) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        if axis.isX { constraints.append(centerXAnchor.constraint(equalTo: view.centerXAnchor)) }
        if axis.isY { constraints.append(centerYAnchor.constraint(equalTo: view.centerYAnchor)) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
