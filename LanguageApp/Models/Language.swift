import Foundation

enum SupportedLanguage: String, CaseIterable, Codable {
    case english = "English"
    case brazilianPortuguese = "Brazilian Portuguese"
    case spanish = "Spanish"
    case french = "French"
    case dutch = "Dutch"

    var code: String {
        switch self {
        case .english: return "en"
        case .brazilianPortuguese: return "pt-BR"
        case .spanish: return "es"
        case .french: return "fr"
        case .dutch: return "nl"
        }
    }

    var flag: String {
        switch self {
        case .english: return "🇺🇸"
        case .brazilianPortuguese: return "🇧🇷"
        case .spanish: return "🇪🇸"
        case .french: return "🇫🇷"
        case .dutch: return "🇳🇱"
        }
    }

    var displayName: String {
        return rawValue
    }
}

struct LanguagePair: Codable, Equatable {
    let native: SupportedLanguage
    let learning: SupportedLanguage

    var displayText: String {
        return "Learning \(learning.displayName) from \(native.displayName)"
    }
}
