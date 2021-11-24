import Foundation

infix operator |: AdditionPrecedence

/// Used to combine two base colors into one dynamic color pair.
/// ```
/// DynamicColor(light: .lightColor, dark: .darkColor)
/// // is equivalent to
/// .lightColor | .darkColor
/// ```
public func | (lightModeColor: BaseColor, darkModeColor: BaseColor) -> DynamicColor {
  DynamicColor(light: lightModeColor, dark: darkModeColor)
}

postfix operator %

/// Used to convert an integer representing a percentage to a double.
public postfix func % (integer: Int) -> Double {
  Double(integer) / 100
}

infix operator ~: MultiplicationPrecedence

/// Used to apply a given alpha level to a base color
/// ```
///  let white: BaseColor = 0xFFFFFF
///  var transparentWhite = white ~ 0.5
///  // or
///  transparentWhite = white ~ 50%
///  // is equivalent to
///  transparentWhite = white.alpha(0.5)
///  ```
public func ~ (baseColor: BaseColor, alpha: Double) -> BaseColor {
  baseColor.alpha(alpha)
}
