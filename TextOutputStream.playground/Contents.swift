import UIKit

extension Unicode.Scalar {
    var name: String? {
        guard var escapedName = "\(self)".applyingTransform(.toUnicodeName,reverse: false) else {
                return nil
        }
        
        escapedName.removeFirst(3) // remove "\\N{"
        escapedName.removeLast(1) // remove "}"
        
        return escapedName
    }
}

struct UnicodeLogger: TextOutputStream {
    mutating func write(_ string: String) {
        guard !string.isEmpty && string != "\n" else {
            return
        }
        
        for (index, unicodeScalar) in string.unicodeScalars.lazy.enumerated() {
            let name = unicodeScalar.name ?? ""
            let codePoint = String(format: "U+%04X", unicodeScalar.value)
            print("\(index): \(unicodeScalar) \(codePoint)\t\(name)")
        }
    }
}

print("👨‍👩‍👧‍👧")

var logger = UnicodeLogger()
print("👨‍👩‍👧‍👧", to: &logger)
