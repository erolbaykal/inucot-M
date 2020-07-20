// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

open class VisitType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = V2Metadata.EntityTypes.visitType.property(withName: "id")

    private static var dateOfVisit_: Property = V2Metadata.EntityTypes.visitType.property(withName: "dateOfVisit")

    private static var locationID_: Property = V2Metadata.EntityTypes.visitType.property(withName: "locationId")

    private static var visitorID_: Property = V2Metadata.EntityTypes.visitType.property(withName: "visitorId")

    private static var location_: Property = V2Metadata.EntityTypes.visitType.property(withName: "Location")

    private static var visitor_: Property = V2Metadata.EntityTypes.visitType.property(withName: "Visitor")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.visitType)
    }

    open class func array(from: EntityValueList) -> [VisitType] {
        return ArrayConverter.convert(from.toArray(), [VisitType]())
    }

    open func copy() -> VisitType {
        return CastRequired<VisitType>.from(self.copyEntity())
    }

    open class var dateOfVisit: Property {
        get {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                return VisitType.dateOfVisit_
            }
        }
        set(value) {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                VisitType.dateOfVisit_ = value
            }
        }
    }

    open var dateOfVisit: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: VisitType.dateOfVisit))
        }
        set(value) {
            self.setOptionalValue(for: VisitType.dateOfVisit, to: value)
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                return VisitType.id_
            }
        }
        set(value) {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                VisitType.id_ = value
            }
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: VisitType.id))
        }
        set(value) {
            self.setOptionalValue(for: VisitType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "id", value: IntValue.of(optional: id))
    }

    open class var location: Property {
        get {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                return VisitType.location_
            }
        }
        set(value) {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                VisitType.location_ = value
            }
        }
    }

    open var location: LocationType? {
        get {
            return CastOptional<LocationType>.from(self.optionalValue(for: VisitType.location))
        }
        set(value) {
            self.setOptionalValue(for: VisitType.location, to: value)
        }
    }

    open class var locationID: Property {
        get {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                return VisitType.locationID_
            }
        }
        set(value) {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                VisitType.locationID_ = value
            }
        }
    }

    open var locationID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: VisitType.locationID))
        }
        set(value) {
            self.setOptionalValue(for: VisitType.locationID, to: IntValue.of(optional: value))
        }
    }

    open var old: VisitType {
        return CastRequired<VisitType>.from(self.oldEntity)
    }

    open class var visitor: Property {
        get {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                return VisitType.visitor_
            }
        }
        set(value) {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                VisitType.visitor_ = value
            }
        }
    }

    open var visitor: VisitorType? {
        get {
            return CastOptional<VisitorType>.from(self.optionalValue(for: VisitType.visitor))
        }
        set(value) {
            self.setOptionalValue(for: VisitType.visitor, to: value)
        }
    }

    open class var visitorID: Property {
        get {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                return VisitType.visitorID_
            }
        }
        set(value) {
            objc_sync_enter(VisitType.self)
            defer { objc_sync_exit(VisitType.self) }
            do {
                VisitType.visitorID_ = value
            }
        }
    }

    open var visitorID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: VisitType.visitorID))
        }
        set(value) {
            self.setOptionalValue(for: VisitType.visitorID, to: IntValue.of(optional: value))
        }
    }
}
