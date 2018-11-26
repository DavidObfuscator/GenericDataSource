import UIKit

public class CollectionViewDataSource<CellType: ModelBoundedCell & UICollectionViewCell>: NSObject, UICollectionViewDataSource {
    private var data = [CellType.SupportedViewModel]()

    public func setData(data: [CellType.SupportedViewModel]) {
        self.data = data
    }

    public func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return data.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = self[indexPath]
        let cell: CellType = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.display(viewModel: model)
        return cell
    }
}

extension CollectionViewDataSource {
    subscript(index: Int) -> CellType.SupportedViewModel {
        return data[index]
    }

    subscript(indexPath: IndexPath) -> CellType.SupportedViewModel {
        return data[indexPath.row]
    }
}
