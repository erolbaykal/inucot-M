// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

internal class V2StaticResolver {
    static func resolve() {
        V2StaticResolver.resolve1()
    }

    private static func resolve1() {
        Ignore.valueOf_any(V2Metadata.EntityTypes.locationType)
        Ignore.valueOf_any(V2Metadata.EntityTypes.visitType)
        Ignore.valueOf_any(V2Metadata.EntityTypes.visitorType)
        Ignore.valueOf_any(V2Metadata.EntitySets.location)
        Ignore.valueOf_any(V2Metadata.EntitySets.visit)
        Ignore.valueOf_any(V2Metadata.EntitySets.visitor)
        Ignore.valueOf_any(LocationType.id)
        Ignore.valueOf_any(LocationType.locationName)
        Ignore.valueOf_any(LocationType.remarks)
        Ignore.valueOf_any(LocationType.visits)
        Ignore.valueOf_any(VisitType.id)
        Ignore.valueOf_any(VisitType.dateOfVisit)
        Ignore.valueOf_any(VisitType.locationID)
        Ignore.valueOf_any(VisitType.visitorID)
        Ignore.valueOf_any(VisitType.location)
        Ignore.valueOf_any(VisitType.visitor)
        Ignore.valueOf_any(VisitorType.id)
        Ignore.valueOf_any(VisitorType.firstName)
        Ignore.valueOf_any(VisitorType.lastName)
        Ignore.valueOf_any(VisitorType.visits)
    }
}
