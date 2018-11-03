// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum General {
    /// Ok
    internal static let ok = L10n.tr("Localizable", "general.ok")
  }

  internal enum Weatherlist {
    /// Weather of Paris
    internal static let title = L10n.tr("Localizable", "weatherlist.title")

    internal enum Error {

      internal enum Loading {
        /// Failed to refresh data
        internal static let message = L10n.tr("Localizable", "weatherlist.error.loading.message")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
