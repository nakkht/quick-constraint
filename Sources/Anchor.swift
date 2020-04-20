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

public enum Anchor {
    case all, top, bottom, leading, trailing, vertical, horizontal
    
    var isTop: Bool {
        switch self {
        case .top, .all, .vertical: return true
        default: return false
        }
    }
    
    var isBottom: Bool {
        switch self {
        case .bottom, .all, .vertical: return true
        default: return false
        }
    }
    
    var isLeading: Bool {
        switch self {
        case .leading, .all, .horizontal: return true
        default: return false
        }
    }
    
    var isTrailing: Bool {
        switch self {
        case .trailing, .all, .horizontal: return true
        default: return false
        }
    }
}
