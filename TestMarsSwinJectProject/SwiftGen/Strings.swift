// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// please enter the latitude and longitude
  internal static let coordinateMessage = L10n.tr("LocalizebleStrings", "CoordinateMessage")
  /// Enter Cordinates
  internal static let cordinatesWarnings = L10n.tr("LocalizebleStrings", "CordinatesWarnings")
  /// Вы удаляете изображение, далее оно не будет показанно в списке фотографий. Продолжить?
  internal static let deletedMessage = L10n.tr("LocalizebleStrings", "deletedMessage")
  /// Данное изображение будет удаленно
  internal static let deletedWarning = L10n.tr("LocalizebleStrings", "deletedWarning")
  /// EarthPhotos
  internal static let ePhotos = L10n.tr("LocalizebleStrings", "ePhotos")
  /// Error was occured
  internal static let error = L10n.tr("LocalizebleStrings", "Error")
  /// MarsPhotos
  internal static let mPhotos = L10n.tr("LocalizebleStrings", "mPhotos")
  /// Welcomesss
  internal static let welcome = L10n.tr("LocalizebleStrings", "Welcome")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
