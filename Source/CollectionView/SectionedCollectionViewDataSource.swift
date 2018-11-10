import UIKit

class SectionedCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private let dataSources: [UICollectionViewDataSource]

    public init(dataSources: [UICollectionViewDataSource]) {
        self.dataSources = dataSources
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSources.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataSource = dataSources[section]
        return dataSource.collectionView(collectionView, numberOfItemsInSection: 0)
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataSource = dataSources[indexPath.section]
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        return dataSource.collectionView(collectionView, cellForItemAt: indexPath)
    }
}
