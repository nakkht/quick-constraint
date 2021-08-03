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

/// Alignment typealias: represents `UIStackView.Alignment` on `UIKit` and `NSLayoutConstraint.Attribute` on `AppKit`
public typealias Alignment = UIStackView.Alignment

/// StackView typealias: represents `UIStackView` on `UIKit` and `NSStackView` on `AppKit`
public typealias StackView = UIStackView

/// StackAxis typealias: represents `NSLayoutConstraint.Axis` on `UIKit` and `NSUserInterfaceLayoutOrientation` on `AppKit`
public typealias StackAxis = NSLayoutConstraint.Axis

/// View typealias: represents `UIView` on `UIKit` and `NSView` on `AppKit`
public typealias View = UIView
#else
/// :nodoc:
import AppKit
/// :nodoc:
public typealias Alignment = NSLayoutConstraint.Attribute
/// :nodoc:
public typealias StackView = NSStackView
/// :nodoc:
public typealias StackAxis = NSUserInterfaceLayoutOrientation
/// :nodoc:
public typealias View = NSView
#endif
