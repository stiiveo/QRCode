
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
    public func image(correctionLevel: CorrectionLevel = .H) -> UIImage? {
        guard let qrcodeImage = CIImage.qrCode(
            url: url,
            correctionLevel: correctionLevel.rawValue) else { return nil }
        
        var scaled = qrcodeImage.scaled(size)
        
        // color
        if let coloredImage = scaled.withColor(
            foreground: color.foreground,
            background: color.background) {
            scaled = coloredImage
        }
        
        // overlay
        if let overlay = overlay,
           let overlayedImage = scaled.addingOverlay(overlay.image, size: overlay.size) {
            scaled = overlayedImage
        }
        
        return UIImage(ciImage: scaled)
    }
}
