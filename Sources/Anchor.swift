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

/// Enum providing definitions of anchors, including combinations
public enum Anchor {
    case all
    case top
    case bottom
    case leading
    case trailing
    case vertical
    case horizontal
    
    /// Determines whether or not enum instance involves top anchor
    var isTop: Bool {
        return self == .top || self == .all || self == .vertical
    }
    
    /// Determines whether or not enum instance involves bottom anchor
    var isBottom: Bool {
        return self == .bottom || self == .all || self == .vertical
    }
    
    /// Determines whether or not enum instance involves leading anchor
    var isLeading: Bool {
        return self == .leading || self == .all || self == .horizontal
    }
    
    /// Determines whether or not enum instance involves trailing anchor
    var isTrailing: Bool {
        return self == .trailing || self == .all || self == .horizontal
    }
}
