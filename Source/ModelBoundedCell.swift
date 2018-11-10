import Foundation

public protocol ModelBoundedCell: ReusableView {
    associatedtype SupportedViewModel
    func display(viewModel: SupportedViewModel)
}
