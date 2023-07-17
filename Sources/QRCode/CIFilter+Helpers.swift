
import UIKit

extension CIFilter {
    static var qrCodeGenerator = CIFilter(name: "CIQRCodeGenerator")
    static var falseColor = CIFilter(name: "CIFalseColor")
    static var sourceOverCompositing = CIFilter(name: "CISourceOverCompositing")
    
    enum Key: String {
        case inputMessage = "inputMessage"
        case inputCorrectionLevel = "inputCorrectionLevel"
        case inputColor0 = "inputColor0"
        case inputColor1 = "inputColor1"
        case inputImage = "inputImage"
        case inputBackgroundImage = "inputBackgroundImage"
    }
    
    func setValue(_ value: Any?, forKey key: Key) {
        setValue(value, forKey: key.rawValue)
    }
}
