import UIKit

extension UIColor {

  convenience init(baseColor: BaseColor) {
    self.init(red: baseColor.red,
              green: baseColor.green,
              blue: baseColor.blue,
              alpha: baseColor.alpha)
  }
}
