// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

public class V2Metadata {
    private static var document_: CSDLDocument = V2Metadata.resolve()

    public static let lock: MetadataLock = MetadataLock()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(V2Metadata.self)
            defer { objc_sync_exit(V2Metadata.self) }
            do {
                return V2Metadata.document_
            }
        }
        set(value) {
            objc_sync_enter(V2Metadata.self)
            defer { objc_sync_exit(V2Metadata.self) }
            do {
                V2Metadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! V2Factory.registerAll()
        V2MetadataParser.parsed.hasGeneratedProxies = true
        return V2MetadataParser.parsed
    }

    public class EntityTypes {
        private static var locationType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.LocationType")

        private static var visitType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.VisitType")

        private static var visitorType_: EntityType = V2MetadataParser.parsed.entityType(withName: "default.VisitorType")

        public static var locationType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.locationType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.locationType_ = value
                }
            }
        }

        public static var visitType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.visitType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.visitType_ = value
                }
            }
        }

        public static var visitorType: EntityType {
            get {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    return V2Metadata.EntityTypes.visitorType_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntityTypes.self)
                defer { objc_sync_exit(V2Metadata.EntityTypes.self) }
                do {
                    V2Metadata.EntityTypes.visitorType_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static var location_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "Location")

        private static var visit_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "Visit")

        private static var visitor_: EntitySet = V2MetadataParser.parsed.entitySet(withName: "Visitor")

        public static var location: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.location_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.location_ = value
                }
            }
        }

        public static var visit: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.visit_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.visit_ = value
                }
            }
        }

        public static var visitor: EntitySet {
            get {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    return V2Metadata.EntitySets.visitor_
                }
            }
            set(value) {
                objc_sync_enter(V2Metadata.EntitySets.self)
                defer { objc_sync_exit(V2Metadata.EntitySets.self) }
                do {
                    V2Metadata.EntitySets.visitor_ = value
                }
            }
        }
    }
}
