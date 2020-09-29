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
    
    convenience init(axis: StackAxis, alignment: Alignment, distribution: Distribution, spacing: CGFloat = 0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        #if os(iOS) || os(tvOS)
        self.axis = axis
        #else
        self.orientation = axis
        #endif
    }
    
    @inline(__always)
    func addArrangedSubviews(_ arrangedSubviews: [View]) {
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
    
    @inline(__always)
    func addArrangedSubviews(_ arrangedSubviews: View...) {
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
}
