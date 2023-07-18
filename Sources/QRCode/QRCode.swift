
import Foundation
import UIKit

public struct QRCode {
    public var url: URL
    public var correctionLevel: CorrectionLevel
    public var size: CGSize
    public var color: Color
    public var overlay: Overlay?
    
    public init(
        url: URL,
        correctionLevel: CorrectionLevel = .H,
        size: CGSize = CGSize(width: 300, height: 300),
        color: Color = Color(foreground: .black, background: .white),
        overlay: Overlay? = nil
    ) {
        self.url = url
        self.correctionLevel = correctionLevel
        self.size = size
        self.color = color
        self.overlay = overlay
    }
}
 
#if canImport(UIKit)
extension QRCode {
    public func image() -> UIImage? {
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
        guard let overlay = overlay else { return UIImage(ciImage: scaled) }
        
        var factor = max(0, overlay.sizeProportion)
        factor = min(1, factor)
        let overlaySize = CGSize(width: size.width * factor,
                                 height: size.height * factor)
        
        if let overlayedImage = scaled.addingOverlay(overlay.image, size: overlaySize) {
            scaled = overlayedImage
        }
        
        return UIImage(ciImage: scaled)
    }
}
#endif
