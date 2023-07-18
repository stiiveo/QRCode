
import UIKit

public struct Color: Equatable {
    public var foreground: UIColor
    public var background: UIColor
    
    public init(foreground: UIColor, background: UIColor) {
        self.foreground = foreground
        self.background = background
    }
}
