//
//  CIImageHelperTests.swift
//  
//
//  Created by JasonOu on 2023/7/18.
//

import XCTest
@testable import QRCode

final class CIImageHelperTests: XCTestCase {
    func test_qrCode_generatesImage() {
        let url = URL(string: "https://example.com")!
        let correctionLevel = "M"
        
        let qrCodeImage = CIImage.qrCode(url: url, correctionLevel: correctionLevel)
        
        XCTAssertNotNil(qrCodeImage, "Failed to generate QR code image")
    }
    
    func test_scaled_scalesImageToCorrectSize() {
        let inputImage = anyCIImage()
        let size = CGSize(width: 100, height: 100)
        
        let scaledImage = inputImage.scaled(size)
        
        XCTAssertEqual(scaledImage.extent.size, size, "Expected size of the scaled image is \(size), get \(scaledImage.extent.size) instead")
    }
    
    func test_withColor_generatesImage() {
        let inputImage = anyCIImage()
        let foregroundColor = UIColor.red
        let backgroundColor = UIColor.blue
        
        let coloredImage = inputImage.withColor(foreground: foregroundColor, background: backgroundColor)
        
        XCTAssertNotNil(coloredImage, "Failed to generate image with color")
    }
    
    func test_addingOverlay_generatesImage() {
        let inputImage = anyCIImage()
        let overlayImage = anyImage()
        let size = CGSize(width: 200, height: 200)
        
        let imageWithOverlay = inputImage.addingOverlay(overlayImage, size: size)
        
        XCTAssertNotNil(imageWithOverlay, "Failed to generate image with added overlay")
    }
    
    private func anyCIImage() -> CIImage {
        CIImage(image: anyImage())!
    }
}
