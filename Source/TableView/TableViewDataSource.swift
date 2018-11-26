import UIKit

public class TableViewDataSource<CellType: ModelBoundedCell & UITableViewCell>: NSObject, UITableViewDataSource {
    private var data = [CellType.SupportedModel]()

    public func setData(data: [CellType.SupportedModel]) {
        self.data = data
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self[indexPath]
        let cell: CellType = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(model: model)
        return cell
    }
}

extension TableViewDataSource {
    public subscript(index: Int) -> CellType.SupportedModel {
        return data[index]
    }

    public subscript(indexPath: IndexPath) -> CellType.SupportedModel {
        return data[indexPath.row]
    }
}
