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

import Foundation

public enum Margin {
    case int(Int)
    case int8(Int8)
    case int16(Int16)
    case int32(Int32)
    case int64(Int64)
    case double(Double)
    case float(Float)
    case cgfloat(CGFloat)
    
    var value: CGFloat {
        switch self {
        case .int(let value): return CGFloat(value)
        case .double(let value): return CGFloat(value)
        case .float(let value): return CGFloat(value)
        case .cgfloat(let value): return value
        case .int8(let value): return CGFloat(value)
        case .int16(let value): return CGFloat(value)
        case .int32(let value): return CGFloat(value)
        case .int64(let value): return CGFloat(value)
        }
    }
}
