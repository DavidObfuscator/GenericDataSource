# GenericDataSource

Data sources for table and collection views in a more reusable manner

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To install GenericDataSource with Carthage, add the following line to your `Cartfile`.

```ogdl
github "DavidObfuscator/GenericDataSource"
```

Run `carthage update` to build the framework and drag the built `GenericDataSource.framework` into your Xcode project.

## Basic Usage

Create view model:

```swift
struct PetViewModel {
    let name: String
    let numberOfLegs: Int
}
```

Create cell view:

```swift
class PetTableViewCell: UITableViewCell, ModelBoundedCell {
    typealias SupportedViewModel = PetViewModel

    func display(viewModel: PetViewModel) {
        // configure cell with view model
    }
}
```

Set up table view:

```swift
class PetListViewController: UIViewController {
    private let tableViewDataSource = TableViewDataSource<PetTableViewCell>()
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.register(PetTableViewCell.self)
        tableView.dataSource = tableViewDataSource
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // add tableview ...

        // Set up ur data:
        tableViewDataSource.setData(data:
            [
                PetViewModel(name: "Doggy", numberOfLegs: 4),
                PetViewModel(name: "Chicky", numberOfLegs: 2),
            ]
        )
        tableView.reloadData()
    }
}
```

## License

MIT license. See the [LICENSE file](LICENSE.txt) for details.
