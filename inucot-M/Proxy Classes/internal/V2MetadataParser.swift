// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

internal class V2MetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = V2MetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = V2MetadataParser.options
        let metadata = parser.parseInProxy(V2MetadataText.xml, url: "default")
        metadata.proxyVersion = "20.3.0-6b3997-20200324"
        return metadata
    }
}
