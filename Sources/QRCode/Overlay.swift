
import UIKit

public struct Overlay: Equatable {
    public let size: CGSize
    public let image: UIImage
    
    public init(size: CGSize, image: UIImage) {
        self.size = size
        self.image = image
    }
}
