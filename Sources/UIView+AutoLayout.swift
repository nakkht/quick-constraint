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

import UIKit

public extension UIView {
    
    @inline(__always)
    @discardableResult
    func pin(to view: UIView, anchor: Anchor = .all, margin: CGFloat = 0) -> [NSLayoutConstraint] {
        if #available(iOS 11.0, *) {
            return pin(toGuide: view.safeAreaLayoutGuide, anchor: anchor, margin: margin)
        } else {
            return pin(toGuide: view, anchor: anchor, margin: margin)
        }
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
    
    @inline(__always)
    @discardableResult
    func center(to view: UIView, axis: Axis) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        if axis.isX { constraints.append(centerXAnchor.constraint(equalTo: view.centerXAnchor)) }
        if axis.isY { constraints.append(centerYAnchor.constraint(equalTo: view.centerYAnchor)) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
