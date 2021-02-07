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

import UIKit

public extension UICollectionView {
    
    convenience init(frame: CGRect = .zero, delegate: UICollectionViewDelegate, spacing: CGFloat = 0) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        self.init(frame: frame, delegate: delegate, layout: layout)
    }
    
    convenience init(frame: CGRect = .zero, delegate: UICollectionViewDelegate, layout: UICollectionViewFlowLayout) {
        self.init(frame: frame, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.contentInset = .zero
        self.scrollIndicatorInsets = .zero
        self.delegate = delegate
    }
    
    func configureWith(_ cellType: UICollectionViewCell.Type, dataSource: UICollectionViewDataSource) {
        register(cellType, forCellWithReuseIdentifier: cellType.reusableIdentifier)
        self.dataSource = dataSource
        self.performBatchUpdates({})
    }
    
    func configureWith(_ cellTypes: [UICollectionViewCell.Type], dataSource: UICollectionViewDataSource) {
        cellTypes.forEach { register($0, forCellWithReuseIdentifier: $0.reusableIdentifier) }
        self.dataSource = dataSource
        self.performBatchUpdates({})
    }
}
