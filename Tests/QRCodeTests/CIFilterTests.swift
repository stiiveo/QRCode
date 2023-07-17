//
//  CIFilterTests.swift
//  
//
//  Created by JasonOu on 2023/7/17.
//

import XCTest
@testable import QRCode

final class CIFilterTests: XCTestCase {
    func test_initializer_helpers() {
        XCTAssertEqual(CIFilter.qrCodeGenerator?.name, "CIQRCodeGenerator")
        XCTAssertEqual(CIFilter.falseColor?.name, "CIFalseColor")
        XCTAssertEqual(CIFilter.sourceOverCompositing?.name, "CISourceOverCompositing")
    }
    
    func test_helper_keys() {
        XCTAssertEqual(CIFilter.Key.inputMessage.rawValue, "inputMessage")
        XCTAssertEqual(CIFilter.Key.inputCorrectionLevel.rawValue, "inputCorrectionLevel")
        XCTAssertEqual(CIFilter.Key.inputColor0.rawValue, "inputColor0")
        XCTAssertEqual(CIFilter.Key.inputColor1.rawValue, "inputColor1")
        XCTAssertEqual(CIFilter.Key.inputImage.rawValue, "inputImage")
        XCTAssertEqual(CIFilter.Key.inputBackgroundImage.rawValue, "inputBackgroundImage")
    }
}
