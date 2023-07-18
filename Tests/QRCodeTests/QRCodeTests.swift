import XCTest
@testable import QRCode

final class QRCodeTests: XCTestCase {
    func test_qrCode_initializer() {
        let url = anyURL()
        let correctionLevel = CorrectionLevel.H
        let size = CGSize(width: 200, height: 200)
        let color = Color(foreground: .blue, background: .white)
        let overlayImage = anyImage()
        let overlay = Overlay(image: overlayImage, sizeProportion: 0.3)
        let qrCode = QRCode(url: url, correctionLevel: correctionLevel, size: size, color: color, overlay: overlay)
        
        XCTAssertEqual(qrCode.url, url)
        XCTAssertEqual(qrCode.correctionLevel, correctionLevel)
        XCTAssertEqual(qrCode.size, size)
        XCTAssertEqual(qrCode.color, color)
        XCTAssertEqual(qrCode.overlay, overlay)
    }
    
    func test_correctionLevel_rawValues() {
        XCTAssertEqual(CorrectionLevel.H.rawValue, "H")
        XCTAssertEqual(CorrectionLevel.L.rawValue, "L")
        XCTAssertEqual(CorrectionLevel.M.rawValue, "M")
        XCTAssertEqual(CorrectionLevel.Q.rawValue, "Q")
    }
    
    func test_image_generatesImage() {
        let size = CGSize(width: 300, height: 300)
        let qrCode = QRCode(
            url: anyURL(),
            correctionLevel: .H,
            size: size,
            color: Color(foreground: .black,
                         background: .white),
            overlay: Overlay(image: anyImage(), sizeProportion: 0.3))
        
        let image = qrCode.image()
        
        XCTAssertNotNil(image, "Failed to generate image from \(qrCode)")
        XCTAssertEqual(image?.size, size, "Expected image size \(size), got \(String(describing: image?.size)) instead")
    }
    
    private func anyURL() -> URL {
        URL(string: "www.google.com")!
    }
}
