import Foundation
import UIKit
import SwiftUI

/// A dynamic color is a combination of two base colors, and
/// will automatically resolve to the correct color based on the
/// current device's trait collection. It can be initialized directly,
/// or via the `|` operator
/// ```
/// var textColor = .black | .white
/// // is equivalent to
/// textColor = DynamicColor(light: .black, dark: .white)
/// ```
public struct DynamicColor {

  let lightModeColor: BaseColor
  let darkModeColor: BaseColor

  /// A UIKit representation of this color.
  public var uiColor: UIColor {
    UIColor { traitCollection in
      switch traitCollection.userInterfaceStyle {
      case .light, .unspecified:
        return UIColor(baseColor: lightModeColor)
      case .dark:
        return UIColor(baseColor: darkModeColor)
      @unknown default:
        return UIColor(baseColor: lightModeColor)
      }
    }
  }

  /// A SwiftUI representation of this color.
  public var color: Color {
    if #available(iOS 15.0, *) {
      return Color(uiColor: uiColor)
    } else {
      return Color(uiColor)
    }
  }

  /// A Quartz representation of this color.
  public var cgColor: CGColor {
    uiColor.cgColor
  }

  /// Initializes the dynamic color based on a base color for both light and dark mode.
  public init(light lightModeColor: BaseColor, dark darkModeColor: BaseColor) {
    self.lightModeColor = lightModeColor
    self.darkModeColor = darkModeColor
  }
}
