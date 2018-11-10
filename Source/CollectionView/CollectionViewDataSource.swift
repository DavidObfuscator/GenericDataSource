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
        let model = data[indexPath.row]
        let cell: CellType = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.display(viewModel: model)
        return cell
    }
}
