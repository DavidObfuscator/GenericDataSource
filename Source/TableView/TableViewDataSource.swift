import UIKit

public class TableViewDataSource<CellType: ModelBoundedCell & UITableViewCell>: NSObject, UITableViewDataSource {
    private var data = [CellType.SupportedViewModel]()

    public func setData(data: [CellType.SupportedViewModel]) {
        self.data = data
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self[indexPath]
        let cell: CellType = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.display(viewModel: model)
        return cell
    }
}

extension TableViewDataSource {
    subscript(index: Int) -> CellType.SupportedViewModel {
        return data[index]
    }

    subscript(indexPath: IndexPath) -> CellType.SupportedViewModel {
        return data[indexPath.row]
    }
}
