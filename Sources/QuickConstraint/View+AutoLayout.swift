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

/// Provides convienience methods for using auto layout and constraining view to the parent.
public extension View {

    /// Creates the most basic  constraints dedicated for constraining to 4 anchors of the parent veiw: top -> top, bottom -> bottom. leading -> leading, trailing -> trailing.
    /// Will attemp to use `safeAreaLayoutGuide` if possible.
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - anchor: Anchor type to be used for determining which constraints to generate. Defaults to `all` and generates constaints to all 4 sides.
    ///   - margin: Number  to be used as a constant for generated constraints. Same value applied to all generated constraints if there are multiple.
    /// - Returns: Generated  active constraints.
    @inline(__always)
    @discardableResult
    func pin(toSafeAreaOf view: View, anchor: Anchor = .all, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        #if os(iOS) || os(tvOS)
        if #available(iOS 11.0, tvOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchor: anchor, margin: margin, isActive: isActive)
        } else {
            return pin(toGuide: view, anchor: anchor, margin: margin, isActive: isActive)
        }
        #else
        return pin(toGuide: view, anchor: anchor, margin: margin, isActive: isHidden)
        #endif
    }

    /// Convenience function for creating constraints while utilizing Margin enum
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - anchor: Anchor type to be used for determining which constraints to generate. Defaults to `all` and generates constaints to all 4 sides.
    ///   - margin: Number  to be used as a constant for generated constraints. Same value applied to all generated constraints if there are multiple. Will automatically handle conversion to CGFloat.
    /// - Returns: Generated  active constraints.
    @inline(__always)
    @discardableResult
    func pin(to view: View, anchor: Anchor = .all, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        return pin(toGuide: view, anchor: anchor, margin: margin, isActive: isActive)
    }

    /// Creates opposite constraints: source top anchor to bottom anchor of the target view.
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - margin: Number of points to be used for generating margin for the view.
    /// - Returns: Generated active constraints.
    @inline(__always)
    @discardableResult
    func pinTopToBottom(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> LayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: margin)
        constraint.isActive = isActive
        return constraint
    }

    /// Creates opposite constraints: source bottom anchor to top anchor of the target view.
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - margin: Number of points to be used for generating margin for the view.
    /// - Returns: Generated active constraints.
    @inline(__always)
    @discardableResult
    func pinBottomToTop(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> LayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: -margin)
        constraint.isActive = isActive
        return constraint
    }

    /// Creates opposite constraints: source leading anchor to trailing anchor of the target view.
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - margin: Number of points to be used for generating margin for the view.
    /// - Returns: Generated active constraints.
    @inline(__always)
    @discardableResult
    func pinLeadingToTrailing(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> LayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: margin)
        constraint.isActive = isActive
        return constraint
    }

    /// Creates opposite constraints: source trailing anchor to leading anchor of the target view.
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - margin: Number of points to be used for generating margin for the view.
    /// - Returns: Generated active constraints.
    @inline(__always)
    @discardableResult
    func pinTrailingToLeading(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> LayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -margin)
        constraint.isActive = isActive
        return constraint
    }

    @inline(__always)
    @discardableResult
    func pinToTopLeading(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        return pin(toGuide: view, anchors: [.top, .leading], margin: margin, isActive: isActive)
    }

    @inline(__always)
    @discardableResult
    func pinToTopLeading(ofSafeArea view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        #if os(iOS) || os(tvOS)
        if #available(iOS 11.0, tvOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchors: [.top, .leading], margin: margin, isActive: isActive)
        } else {
            return pin(toGuide: view, anchors: [.top, .leading], margin: margin, isActive: isActive)
        }
        #else
        return pin(toGuide: view, anchors: [.top, .leading], margin: margin, isActive: isActive)
        #endif
    }

    @inline(__always)
    @discardableResult
    func pinToTopTrailing(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        return pin(toGuide: view, anchors: [.top, .trailing], margin: margin, isActive: isActive)
    }

    @inline(__always)
    @discardableResult
    func pinToTopTrailing(ofSafeArea view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        #if os(iOS) || os(tvOS)
        if #available(iOS 11.0, tvOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchors: [.top, .trailing], margin: margin, isActive: isActive)
        } else {
            return pin(toGuide: view, anchors: [.top, .trailing], margin: margin, isActive: isActive)
        }
        #else
        return pin(toGuide: view, anchors: [.top, .trailing], margin: margin, isActive: isActive)
        #endif
    }

    @inline(__always)
    @discardableResult
    func pinToBottomLeading(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        return pin(toGuide: view, anchors: [.bottom, .leading], margin: margin, isActive: isActive)
    }

    @inline(__always)
    @discardableResult
    func pinToBottomLeading(ofSafeArea view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        #if os(iOS) || os(tvOS)
        if #available(iOS 11.0, tvOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchors: [.bottom, .leading], margin: margin, isActive: isActive)
        } else {
            return pin(toGuide: view, anchors: [.bottom, .leading], margin: margin, isActive: isActive)
        }
        #else
        return pin(toGuide: view, anchors: [.bottom, .leading], margin: margin, isActive: isActive)
        #endif
    }

    @inline(__always)
    @discardableResult
    func pinToBottomTrailing(of view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        return pin(toGuide: view, anchors: [.bottom, .trailing], margin: margin, isActive: isActive)
    }

    @inline(__always)
    @discardableResult
    func pinToBottomTrailing(ofSafeArea view: View, margin: CGFloat = 0, isActive: Bool = true) -> [Anchor: LayoutConstraint] {
        #if os(iOS) || os(tvOS)
        if #available(iOS 11.0, tvOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchors: [.bottom, .trailing], margin: margin, isActive: isActive)
        } else {
            return pin(toGuide: view, anchors: [.bottom, .trailing], margin: margin, isActive: isActive)
        }
        #else
        return pin(toGuide: view, anchors: [.bottom, .trailing], margin: margin, isActive: isActive)
        #endif
    }

    private func pin(toGuide guide: AnyObject, anchors: [Anchor], margin: CGFloat = 0, isActive: Bool) -> [Anchor: LayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [Anchor: LayoutConstraint]()
        anchors.forEach {
            if $0.isTop { constraints[.top] = bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin) }
            if $0.isBottom { constraints[.bottom] = bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin) }
            if $0.isLeading { constraints[.leading] = leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin) }
            if $0.isTrailing { constraints[.trailing] = trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin) }
        }
        if isActive { LayoutConstraint.activate(Array(constraints.values)) }
        return constraints
    }

    private func pin(toGuide guide: AnyObject, anchor: Anchor = .all, margin: CGFloat, isActive: Bool) -> [Anchor: LayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [Anchor: LayoutConstraint]()
        if anchor.isTop { constraints[.top] = topAnchor.constraint(equalTo: guide.topAnchor, constant: margin) }
        if anchor.isBottom { constraints[.bottom] = bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin) }
        if anchor.isLeading { constraints[.leading] = leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin) }
        if anchor.isTrailing { constraints[.trailing] = trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin) }
        if isActive { LayoutConstraint.activate(Array(constraints.values)) }
        return constraints
    }

    /// Creates constraints for width/height/size dimensions with specified size.
    /// - Parameters:
    ///   - dimension: Dimension type to be used for determining which constraints to generate. Use `size` to generate width and height constraints simultaneously.
    ///   - value: Size of set dimensions.
    /// - Returns: Generated active constraints.
    @inline(__always)
    @discardableResult
    func set(_ dimension: Dimension, _ value: CGFloat) -> [LayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [LayoutConstraint]()
        if dimension.isWidth { constraints.append(widthAnchor.constraint(equalToConstant: value)) }
        if dimension.isHeight { constraints.append(heightAnchor.constraint(equalToConstant: value)) }
        LayoutConstraint.activate(constraints)
        return constraints
    }

    /// Creates constraints for width/height/size dimensions based on another view's width/height/size.
    /// - Parameters:
    ///   - dimension: Dimension type to be used for determining which dimension constraints to generate. Use `size` to generate width and height constraints simultaneously..
    ///   - view: Parent of sibling view to use as a reference for constraints.
    ///   - multiplier: The multiplier constant for the constraint.
    /// - Returns: Generated active constraints.
    @discardableResult
    func set(_ dimension: Dimension, to view: View, multiplier: CGFloat = 1.0) -> [LayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [LayoutConstraint]()
        if dimension.isWidth { constraints.append(widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier)) }
        if dimension.isHeight { constraints.append(heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)) }
        LayoutConstraint.activate(constraints)
        return constraints
    }

    /// Creates constraints based on center x and y axis.
    /// - Parameters:
    ///   - view: Target view to which apply constrainta. Can be parent view or view which shares the same parent. Both source and target views have to be part of the view hierarchy.
    ///   - axis: Axis type to be used for determining which constraints to generate. Use `all` to generate center constraints for x and y axis simultaneously.
    /// - Returns: Generated active constraints.
    @inline(__always)
    @discardableResult
    func center(to view: View, axis: Axis? = nil) -> [LayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [LayoutConstraint]()
        if axis?.isX ?? true { constraints.append(centerXAnchor.constraint(equalTo: view.centerXAnchor)) }
        if axis?.isY ?? true { constraints.append(centerYAnchor.constraint(equalTo: view.centerYAnchor)) }
        LayoutConstraint.activate(constraints)
        return constraints
    }
}
