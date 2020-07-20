// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

internal class V2Factory {
    static func registerAll() throws {
        V2Metadata.EntityTypes.locationType.registerFactory(ObjectFactory.with(create: { LocationType(withDefaults: false) }, createWithDecoder: { d in try LocationType(from: d) }))
        V2Metadata.EntityTypes.visitType.registerFactory(ObjectFactory.with(create: { VisitType(withDefaults: false) }, createWithDecoder: { d in try VisitType(from: d) }))
        V2Metadata.EntityTypes.visitorType.registerFactory(ObjectFactory.with(create: { VisitorType(withDefaults: false) }, createWithDecoder: { d in try VisitorType(from: d) }))
        V2StaticResolver.resolve()
    }
}
