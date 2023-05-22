import Foundation

extension String {
    // Extension needed to check deeplink URL and substract the long and let location information
    
    /// Returns an array of substrings between the specified left and right strings.
    /// Returns an empty array when there are no matches.
    func substring(from left: String, to right: String) -> [String] {
        // Escape special characters in the left and right strings for use in a regular expression
        let leftEscaped = NSRegularExpression.escapedPattern(for: left)
        let rightEscaped = NSRegularExpression.escapedPattern(for: right)

        // Create a regular expression pattern to match content between the last occurrence of the left string
        // and the right string
        let pattern = "\(leftEscaped).*(?<=\(leftEscaped))(.*?)(?=\(rightEscaped))"

        // Create a regular expression object with the pattern
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return []
        }

        // Find matches in the current string
        let matches = regex.matches(in: self, options: [], range: NSRange(startIndex..., in: self))

        // Extract the substrings from the matches and return them in an array
        return matches.compactMap { match in
            guard let range = Range(match.range(at: 1), in: self) else { return nil }
            return String(self[range])
        }
    }
}
