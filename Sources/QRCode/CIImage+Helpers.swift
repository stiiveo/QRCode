
import UIKit

extension CIImage {
    static func qrCode(url: URL, correctionLevel: String) -> CIImage? {
        guard let filter = CIFilter.qrCodeGenerator else { return nil }
        
        filter.setDefaults()
        filter.setValue(url.absoluteString.data(using: .ascii), forKey: .inputMessage)
        filter.setValue(correctionLevel, forKey: .inputCorrectionLevel)
        // https://www.qrcode.com/en/about/error_correction.html
        return filter.outputImage
    }
    
    func scaled(_ size: CGSize) -> CIImage {
        let scaleW = size.width / extent.size.width
        let scaleH = size.height / extent.size.height
        let transform = CGAffineTransform(scaleX: scaleW, y: scaleH)
        return transformed(by: transform)
    }
    
    func withColor(foreground: UIColor, background: UIColor) -> CIImage? {
        guard let colorFilter = CIFilter.falseColor else { return self }
        
        colorFilter.setValue(self, forKey: kCIInputImageKey)
        colorFilter.setValue(CIColor(color: foreground), forKey: .inputColor0)
        colorFilter.setValue(CIColor(color: background), forKey: .inputColor1)
        return colorFilter.outputImage
    }
    
    func addingOverlay(_ overlay: UIImage, size: CGSize) -> CIImage? {
        guard let combinedFilter = CIFilter.sourceOverCompositing,
              let cgImage = overlay.cgImage else {
            return self
        }
        
        let ciImage = CIImage(cgImage: cgImage).scaled(size)
        let centerTransform = CGAffineTransform(
            translationX: extent.midX - (ciImage.extent.size.width / 2),
            y: extent.midY - (ciImage.extent.size.height / 2))
        
        combinedFilter.setValue(ciImage.transformed(by: centerTransform), forKey: .inputImage)
        combinedFilter.setValue(self, forKey: .inputBackgroundImage)
        return combinedFilter.outputImage
    }
}

