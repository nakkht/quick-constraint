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

extension UIView {
    
    @inline(__always)
    func pin(to view: UIView, anchor: Anchor = .all, margin: CGFloat = 0) {
        pin(toGuide: view, anchor: anchor, margin: margin)
    }
    
    @inline(__always)
    @available(iOS 11.0, *)
    func pin(toSafeAreaOf view: UIView, anchor: Anchor = .all, margin: CGFloat = 0) {
        pin(toGuide: view.safeAreaLayoutGuide, anchor: anchor, margin: margin)
    }
    
    private func pin(toGuide guide: AnyObject, anchor: Anchor = .all, margin: CGFloat) {
        let top = (anchor == .all || anchor == .top || anchor == .vertical)
        let bottom = (anchor == .all || anchor == .bottom || anchor == .vertical)
        let leading = (anchor == .all || anchor == .leading || anchor == .horizontal)
        let trailing = (anchor == .all || anchor == .trailing || anchor == .horizontal)
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: guide.topAnchor, constant: margin).isActive = top
        bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin).isActive = bottom
        leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = leading
        trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin).isActive = trailing
    }
    
    @inline(__always)
    func set(_ dimension: Dimension, _ value: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: value).isActive = (dimension == .width)
        heightAnchor.constraint(equalToConstant: value).isActive = (dimension == .height)
    }
    
    @inline(__always)
    func setSize(_ width: CGFloat, _ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        set(.width, width)
        set(.height, height)
    }
    
    @inline(__always)
    func center(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        center(to: view, axis: .x)
        center(to: view, axis: .y)
    }
    
    @inline(__always)
    func center(to view: UIView, axis: Axis) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = (axis == .x)
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = (axis == .y)
    }
}
