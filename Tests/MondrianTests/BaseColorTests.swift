import XCTest
@testable import Mondrian

final class BaseColorTests: XCTestCase {

  func testInitHexadecimalInteger_givenHexadecimalForWhite_initializesWithColorValuesForWhite() {
    // Arrange
    let hexadecimalInteger = 0xFFFFFF
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 1)

    // Act
    let baseColor = BaseColor(hex: hexadecimalInteger)

    // Assert
    XCTAssertEqual(baseColor, expectedBaseColor)
  }

  func testInitHexadecimalInteger_givenHexadecimalForWhiteWithAlpha_initializesWithColorValuesForWhiteWithAlpha() {
    // Arrange
    let hexadecimalInteger = 0xFFFFFF
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 0.5)

    // Act
    let baseColor = BaseColor(hex: hexadecimalInteger, alpha: 0.5)

    // Assert
    XCTAssertEqual(baseColor, expectedBaseColor)
  }

  func testInitHexadecimalString_givenLowercasedHexadecimalForWhite_initializesWithColorValuesForWhite() {
    // Arrange
    let hexadecimalString = "#ffffff"
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 1)

    // Act
    let baseColor = BaseColor(hex: hexadecimalString)

    // Assert
    XCTAssertEqual(baseColor, expectedBaseColor)
  }

  func testInitHexadecimalString_givenUppercasedHexadecimalForWhite_initializesWithColorValuesForWhite() {
    // Arrange
    let hexadecimalString = "#FFFFFF"
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 1)

    // Act
    let baseColor = BaseColor(hex: hexadecimalString)

    // Assert
    XCTAssertEqual(baseColor, expectedBaseColor)
  }

  func testInitHexadecimalString_givenHexadecimalForWhiteWithoutPoundSymbol_initializesWithColorValuesForWhite() {
    // Arrange
    let hexadecimalString = "FFFFFF"
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 1)

    // Act
    let baseColor = BaseColor(hex: hexadecimalString)

    // Assert
    XCTAssertEqual(baseColor, expectedBaseColor)
  }

  func testInitHexadecimalString_givenHexadecimalForWhiteWithAlpha_initializesWithColorValuesForWhiteWithAlpha() {
    // Arrange
    let hexadecimalString = "FFFFFF"
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 0.5)

    // Act
    let baseColor = BaseColor(hex: hexadecimalString, alpha: 0.5)

    // Assert
    XCTAssertEqual(baseColor, expectedBaseColor)
  }

  func testAlpha_givenAlphaLevel_returnsSameColorWithNewAlphaLevel() {
    // Arrange
    let baseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 1)
    let expectedBaseColor = BaseColor(red: 1, green: 1, blue: 1, alpha: 0.5)

    // Act
    let alphaBaseColor = baseColor.alpha(0.5)

    // Assert
    XCTAssertEqual(alphaBaseColor, expectedBaseColor)
  }
}
