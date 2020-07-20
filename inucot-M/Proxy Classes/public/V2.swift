// # Proxy Compiler 20.3.0-6b3997-20200324

import Foundation
import SAPOData

open class V2<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = V2Metadata.document
    }

    open func fetchLocation(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [LocationType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try LocationType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.location), headers: var_headers, options: var_options).entityList())
    }

    open func fetchLocation(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([LocationType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchLocation(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchLocationType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> LocationType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<LocationType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.location), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchLocationType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (LocationType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchLocationType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchLocationTypeWithKey(id: Int?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> LocationType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchLocationType(matching: var_query.withKey(LocationType.key(id: id)), headers: headers, options: options)
    }

    open func fetchLocationTypeWithKey(id: Int?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (LocationType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchLocationTypeWithKey(id: id, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVisit(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [VisitType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try VisitType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.visit), headers: var_headers, options: var_options).entityList())
    }

    open func fetchVisit(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([VisitType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchVisit(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVisitType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> VisitType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<VisitType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.visit), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchVisitType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (VisitType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchVisitType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVisitTypeWithKey(id: Int?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> VisitType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchVisitType(matching: var_query.withKey(VisitType.key(id: id)), headers: headers, options: options)
    }

    open func fetchVisitTypeWithKey(id: Int?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (VisitType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchVisitTypeWithKey(id: id, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVisitor(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [VisitorType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try VisitorType.array(from: self.executeQuery(var_query.fromDefault(V2Metadata.EntitySets.visitor), headers: var_headers, options: var_options).entityList())
    }

    open func fetchVisitor(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([VisitorType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchVisitor(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVisitorType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> VisitorType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<VisitorType>.from(self.executeQuery(query.fromDefault(V2Metadata.EntitySets.visitor), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchVisitorType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (VisitorType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchVisitorType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchVisitorTypeWithKey(id: Int?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> VisitorType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchVisitorType(matching: var_query.withKey(VisitorType.key(id: id)), headers: headers, options: options)
    }

    open func fetchVisitorTypeWithKey(id: Int?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (VisitorType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchVisitorTypeWithKey(id: id, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open override var metadataLock: MetadataLock {
        return V2Metadata.lock
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadataWithLock(service: self, fetcher: nil, options: V2MetadataParser.options, mergeAction: { V2MetadataChanges.merge(metadata: self.metadata) })
        }
    }
}
