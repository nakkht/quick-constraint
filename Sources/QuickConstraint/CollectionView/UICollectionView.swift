//
// Copyright 2021 Paulius Gudonis
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

public extension UICollectionView {

    /// Convenience initializer for simple `UICollectionView` with `UICollectionViewFlowLayout` layout.
    /// - Parameters:
    ///   - frame: The frame rectangle for the collection view. Passed as-is when creating `UICollectionView`. Defaults to `.zero`
    ///   - delegate: Delegate to receive events from `UICollectionView`.
    ///   - spacing: Spacing value in points between layed items. Defaults to 0.0
    convenience init(frame: CGRect = .zero, delegate: UICollectionViewDelegate, spacing: CGFloat = 0) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        self.init(frame: frame, delegate: delegate, layout: layout)
    }

    /// Convenience initializer for `UICollectionView` with provided `UICollectionViewFlowLayout`
    /// - Parameters:
    ///   - frame: The frame rectangle for the collection view. Passed as-is when creating `UICollectionView`. Defaults to `.zero`
    ///   - delegate: Delegate to receive events from `UICollectionView`.
    ///   - layout: Custom `UICollectionViewFlowLayout` describing how to layout items in `UICollectionView`.
    convenience init(frame: CGRect = .zero, delegate: UICollectionViewDelegate, layout: UICollectionViewFlowLayout) {
        self.init(frame: frame, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.contentInset = .zero
        self.scrollIndicatorInsets = .zero
        self.delegate = delegate
    }

    /// Convenience function to setup `UICollectionView` with reusable cell and data source.
    /// - Parameters:
    ///   - cellType: Single cell type to be used and reused within `UICollectionView`.
    ///   - dataSource: Data source to provide data based on associated callbacks.
    func configureWith(_ cellType: UICollectionViewCell.Type, dataSource: UICollectionViewDataSource) {
        register(cellType, forCellWithReuseIdentifier: cellType.reusableIdentifier)
        self.dataSource = dataSource
        self.performBatchUpdates({})
    }

    /// Convenience function to setup `UICollectionView` with reusable cells and data source.
    /// - Parameters:
    ///   - cellTypes: Array of cell types to be used and reused within `UICollectionView`.
    ///   - dataSource: Data source to provide data based on associated callbacks.
    func configureWith(_ cellTypes: [UICollectionViewCell.Type], dataSource: UICollectionViewDataSource) {
        cellTypes.forEach { register($0, forCellWithReuseIdentifier: $0.reusableIdentifier) }
        self.dataSource = dataSource
        self.performBatchUpdates({})
    }
}

#endif
