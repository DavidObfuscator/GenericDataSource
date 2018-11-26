import Foundation

public protocol ModelBoundedCell: ReusableView {
    associatedtype SupportedModel
    func configure(model: SupportedModel)
}
