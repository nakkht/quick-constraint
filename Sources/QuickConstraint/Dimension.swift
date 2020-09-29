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

/// Enum providing definitions of dimension options
public enum Dimension {
    
    case width
    case height
    case size
    
    /// Determines whether or not enum instance involves width dimentsion
    var isWidth: Bool {
        return self == .width || self == .size
    }
    
    /// Determines whether or not enum instance involves height dimentsion
    var isHeight: Bool {
        return self == .height || self == .size
    }
}
