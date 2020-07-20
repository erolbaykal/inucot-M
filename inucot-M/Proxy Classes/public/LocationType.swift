// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

open class LocationType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = V2Metadata.EntityTypes.locationType.property(withName: "id")

    private static var locationName_: Property = V2Metadata.EntityTypes.locationType.property(withName: "locationName")

    private static var remarks_: Property = V2Metadata.EntityTypes.locationType.property(withName: "remarks")

    private static var visits_: Property = V2Metadata.EntityTypes.locationType.property(withName: "Visits")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.locationType)
    }

    open class func array(from: EntityValueList) -> [LocationType] {
        return ArrayConverter.convert(from.toArray(), [LocationType]())
    }

    open func copy() -> LocationType {
        return CastRequired<LocationType>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                return LocationType.id_
            }
        }
        set(value) {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                LocationType.id_ = value
            }
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: LocationType.id))
        }
        set(value) {
            self.setOptionalValue(for: LocationType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "id", value: IntValue.of(optional: id))
    }

    open class var locationName: Property {
        get {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                return LocationType.locationName_
            }
        }
        set(value) {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                LocationType.locationName_ = value
            }
        }
    }

    open var locationName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: LocationType.locationName))
        }
        set(value) {
            self.setOptionalValue(for: LocationType.locationName, to: StringValue.of(optional: value))
        }
    }

    open var old: LocationType {
        return CastRequired<LocationType>.from(self.oldEntity)
    }

    open class var remarks: Property {
        get {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                return LocationType.remarks_
            }
        }
        set(value) {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                LocationType.remarks_ = value
            }
        }
    }

    open var remarks: String? {
        get {
            return StringValue.optional(self.optionalValue(for: LocationType.remarks))
        }
        set(value) {
            self.setOptionalValue(for: LocationType.remarks, to: StringValue.of(optional: value))
        }
    }

    open class var visits: Property {
        get {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                return LocationType.visits_
            }
        }
        set(value) {
            objc_sync_enter(LocationType.self)
            defer { objc_sync_exit(LocationType.self) }
            do {
                LocationType.visits_ = value
            }
        }
    }

    open var visits: [VisitType] {
        get {
            return ArrayConverter.convert(LocationType.visits.entityList(from: self).toArray(), [VisitType]())
        }
        set(value) {
            LocationType.visits.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }
}
