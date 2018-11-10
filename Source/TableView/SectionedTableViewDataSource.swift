import UIKit

public class SectionedTableViewDataSource: NSObject, UITableViewDataSource {
    private let dataSources: [UITableViewDataSource]

    public init(dataSources: [UITableViewDataSource]) {
        self.dataSources = dataSources
    }

    public func numberOfSections(in _: UITableView) -> Int {
        return dataSources.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSource = dataSources[section]
        return dataSource.tableView(tableView, numberOfRowsInSection: 0)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = dataSources[indexPath.section]
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}
