import XCTest
@testable import QRCode

final class QRCodeTests: XCTestCase {
    func test_initializer_parameters() throws {
        let url = anyURL()
        let size = CGSize(width: 200, height: 200)
        let color = Color(foreground: .blue, background: .white)
        let overlayImage = UIImage(systemName: "star")!
        let overlay = Overlay(size: CGSize(width: 50, height: 50), image: overlayImage)
        let qrCode = QRCode(url: url, size: size, color: color, overlay: overlay)
        
        XCTAssertEqual(qrCode.url, url)
        XCTAssertEqual(qrCode.size, size)
        XCTAssertEqual(qrCode.color, color)
        XCTAssertEqual(qrCode.overlay, overlay)
    }
    
    private func anyURL() -> URL {
        URL(string: "www.google.com")!
    }
}
