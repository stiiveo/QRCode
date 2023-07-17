import Foundation
import UIKit

public struct QRCode {
    public let url: URL
    public let size: CGSize
    public let color: Color
    public let overlay: Overlay?
    
    public init(
        url: URL,
        size: CGSize = CGSize(width: 300, height: 300),
        color: Color = Color(foreground: .black, background: .white),
        overlay: Overlay? = nil
    ) {
        self.url = url
        self.size = size
        self.color = color
        self.overlay = overlay
    }
}

extension QRCode {
    public struct Color {
        public let foreground: UIColor
        public let background: UIColor
        
        public init(foreground: UIColor, background: UIColor) {
            self.foreground = foreground
            self.background = background
        }
    }
    
    public struct Overlay {
        public let size: CGSize
        public let image: UIImage
        
        public init(size: CGSize, image: UIImage) {
            self.size = size
            self.image = image
        }
    }
}
