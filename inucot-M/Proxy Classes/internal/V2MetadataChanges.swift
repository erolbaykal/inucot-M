// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

internal class V2MetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        V2Metadata.document = metadata
        V2MetadataChanges.merge1(metadata: metadata)
        try! V2Factory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !V2Metadata.EntityTypes.locationType.isRemoved {
            V2Metadata.EntityTypes.locationType = metadata.entityType(withName: "default.LocationType")
        }
        if !V2Metadata.EntityTypes.visitType.isRemoved {
            V2Metadata.EntityTypes.visitType = metadata.entityType(withName: "default.VisitType")
        }
        if !V2Metadata.EntityTypes.visitorType.isRemoved {
            V2Metadata.EntityTypes.visitorType = metadata.entityType(withName: "default.VisitorType")
        }
        if !V2Metadata.EntitySets.location.isRemoved {
            V2Metadata.EntitySets.location = metadata.entitySet(withName: "Location")
        }
        if !V2Metadata.EntitySets.visit.isRemoved {
            V2Metadata.EntitySets.visit = metadata.entitySet(withName: "Visit")
        }
        if !V2Metadata.EntitySets.visitor.isRemoved {
            V2Metadata.EntitySets.visitor = metadata.entitySet(withName: "Visitor")
        }
        if !LocationType.id.isRemoved {
            LocationType.id = V2Metadata.EntityTypes.locationType.property(withName: "id")
        }
        if !LocationType.locationName.isRemoved {
            LocationType.locationName = V2Metadata.EntityTypes.locationType.property(withName: "locationName")
        }
        if !LocationType.remarks.isRemoved {
            LocationType.remarks = V2Metadata.EntityTypes.locationType.property(withName: "remarks")
        }
        if !LocationType.visits.isRemoved {
            LocationType.visits = V2Metadata.EntityTypes.locationType.property(withName: "Visits")
        }
        if !VisitType.id.isRemoved {
            VisitType.id = V2Metadata.EntityTypes.visitType.property(withName: "id")
        }
        if !VisitType.dateOfVisit.isRemoved {
            VisitType.dateOfVisit = V2Metadata.EntityTypes.visitType.property(withName: "dateOfVisit")
        }
        if !VisitType.locationID.isRemoved {
            VisitType.locationID = V2Metadata.EntityTypes.visitType.property(withName: "locationId")
        }
        if !VisitType.visitorID.isRemoved {
            VisitType.visitorID = V2Metadata.EntityTypes.visitType.property(withName: "visitorId")
        }
        if !VisitType.location.isRemoved {
            VisitType.location = V2Metadata.EntityTypes.visitType.property(withName: "Location")
        }
        if !VisitType.visitor.isRemoved {
            VisitType.visitor = V2Metadata.EntityTypes.visitType.property(withName: "Visitor")
        }
        if !VisitorType.id.isRemoved {
            VisitorType.id = V2Metadata.EntityTypes.visitorType.property(withName: "id")
        }
        if !VisitorType.firstName.isRemoved {
            VisitorType.firstName = V2Metadata.EntityTypes.visitorType.property(withName: "firstName")
        }
        if !VisitorType.lastName.isRemoved {
            VisitorType.lastName = V2Metadata.EntityTypes.visitorType.property(withName: "lastName")
        }
        if !VisitorType.visits.isRemoved {
            VisitorType.visits = V2Metadata.EntityTypes.visitorType.property(withName: "Visits")
        }
    }
}
