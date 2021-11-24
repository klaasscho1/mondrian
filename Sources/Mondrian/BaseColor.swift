import SwiftUI
import UIKit

/// A base color is meant to be used in tandem with another base color in order
/// to create a dynamic color that can be used in both light and dark mode. Base
/// colors can be initialized from both hexadecimal integers and strings, as well as
/// from plain RGB(A) values.
/// ```
/// var white: BaseColor = 0xFFFFFF
/// // is equivalent to
/// white = "#ffffff" // or "ffffff", "#FFFFFF", ...
/// // as well as
/// white = BaseColor(red: 1, green: 1, blue: 1, alpha: 1)
/// ```
public struct BaseColor: ExpressibleByIntegerLiteral, ExpressibleByStringLiteral {

  let red: Double
  let green: Double
  let blue: Double
  var alpha: Double

  /// Initializes the base color based on RGB(A) values. Alpha value is 1.0 by default.
  public init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
    self.red = red
    self.green = green
    self.blue = blue
    self.alpha = alpha
  }

  /// Initializes the base color based on a hexidecimal integer and optional alpha level (default = 1).
  public init(hex hexadecimalInteger: Int, alpha: Double = 1.0) {
    self.init(red: Double((hexadecimalInteger & 0xff0000) >> 16) / 255,
              green: Double((hexadecimalInteger & 0x00ff00) >> 8) / 255,
              blue: Double(hexadecimalInteger & 0x0000ff) / 255,
              alpha: alpha)
  }

  /// Initializes the base color based on a hexidecimal string and optional alpha level (default = 1).
  public init(hex hexadecimalString: String, alpha: Double = 1.0) {
    var hexadecimalString: String = hexadecimalString
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .uppercased()
    if (hexadecimalString.hasPrefix("#")) {
      hexadecimalString.remove(at: hexadecimalString.startIndex)
    }
    var hexadecimalInteger: UInt64 = 0
    Scanner(string: hexadecimalString).scanHexInt64(&hexadecimalInteger)
    self.init(hex: Int(hexadecimalInteger), alpha: alpha)
  }

  public init(integerLiteral value: Int) {
    self.init(hex: value)
  }

  public init(stringLiteral value: String) {
    self.init(hex: value)
  }

  /// Returns a version of the color with the given alpha level.
  public func alpha(_ alpha: Double) -> BaseColor {
    var newColor = self
    newColor.alpha = alpha
    return newColor
  }
}
