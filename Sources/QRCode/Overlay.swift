
import UIKit

public struct Overlay: Equatable {
    public var image: UIImage
    public var sizeProportion: CGFloat
    
    /// Creates an Overlay object using the provided image and size proportion.
    /// - Parameters:
    ///   - image: The image laid above the QRCode image.
    ///   - proportion: The size proportion relative to the QRCode image, specified as a value from 0.0 to 1.0. Values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
    public init(image: UIImage, sizeProportion: CGFloat) {
        self.image = image
        self.sizeProportion = sizeProportion
    }
}
