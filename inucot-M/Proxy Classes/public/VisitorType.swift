// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

open class VisitorType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = V2Metadata.EntityTypes.visitorType.property(withName: "id")

    private static var firstName_: Property = V2Metadata.EntityTypes.visitorType.property(withName: "firstName")

    private static var lastName_: Property = V2Metadata.EntityTypes.visitorType.property(withName: "lastName")

    private static var visits_: Property = V2Metadata.EntityTypes.visitorType.property(withName: "Visits")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: V2Metadata.EntityTypes.visitorType)
    }

    open class func array(from: EntityValueList) -> [VisitorType] {
        return ArrayConverter.convert(from.toArray(), [VisitorType]())
    }

    open func copy() -> VisitorType {
        return CastRequired<VisitorType>.from(self.copyEntity())
    }

    open class var firstName: Property {
        get {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                return VisitorType.firstName_
            }
        }
        set(value) {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                VisitorType.firstName_ = value
            }
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VisitorType.firstName))
        }
        set(value) {
            self.setOptionalValue(for: VisitorType.firstName, to: StringValue.of(optional: value))
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                return VisitorType.id_
            }
        }
        set(value) {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                VisitorType.id_ = value
            }
        }
    }

    open var id: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: VisitorType.id))
        }
        set(value) {
            self.setOptionalValue(for: VisitorType.id, to: IntValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: Int?) -> EntityKey {
        return EntityKey().with(name: "id", value: IntValue.of(optional: id))
    }

    open class var lastName: Property {
        get {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                return VisitorType.lastName_
            }
        }
        set(value) {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                VisitorType.lastName_ = value
            }
        }
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: VisitorType.lastName))
        }
        set(value) {
            self.setOptionalValue(for: VisitorType.lastName, to: StringValue.of(optional: value))
        }
    }

    open var old: VisitorType {
        return CastRequired<VisitorType>.from(self.oldEntity)
    }

    open class var visits: Property {
        get {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                return VisitorType.visits_
            }
        }
        set(value) {
            objc_sync_enter(VisitorType.self)
            defer { objc_sync_exit(VisitorType.self) }
            do {
                VisitorType.visits_ = value
            }
        }
    }

    open var visits: [VisitType] {
        get {
            return ArrayConverter.convert(VisitorType.visits.entityList(from: self).toArray(), [VisitType]())
        }
        set(value) {
            VisitorType.visits.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }
}
