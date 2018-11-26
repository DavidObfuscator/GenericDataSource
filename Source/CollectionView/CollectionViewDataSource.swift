import UIKit

public class CollectionViewDataSource<CellType: ModelBoundedCell & UICollectionViewCell>: NSObject, UICollectionViewDataSource {
    private var data = [CellType.SupportedModel]()

    public func setData(data: [CellType.SupportedModel]) {
        self.data = data
    }

    public func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return data.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = self[indexPath]
        let cell: CellType = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(model: model)
        return cell
    }
}

extension CollectionViewDataSource {
    public subscript(index: Int) -> CellType.SupportedModel {
        return data[index]
    }

    public subscript(indexPath: IndexPath) -> CellType.SupportedModel {
        return data[indexPath.row]
    }
}
