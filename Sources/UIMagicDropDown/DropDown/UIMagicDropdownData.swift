import Foundation

public struct UIMagicDropdownData {
    public var label: (String)
    public var value: Any?

    public init(label: String, value: Any?) {
        self.label = label
        self.value = value
    }
}
