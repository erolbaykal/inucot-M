//
// inucot-M
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 20/07/20
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData

public class Inucot_xsodata_mobile_services_destinationOnlineODataController: ODataControlling {
    private let logger = Logger.shared(named: "Inucot_xsodata_mobile_services_destinationOnlineODataController")
    var v2: V2<OnlineODataProvider>!

    public init() {}

    // MARK: - Public methods

    // Read more about consumption of OData services in mobile applications: https://help.sap.com/viewer/fc1a59c210d848babfb3f758a6f55cb1/Latest/en-US/22e9533533c646d8831e87357519cf4e.html
    public func configureOData(sapURLSession: SAPURLSession, serviceRoot: URL) throws {
        let odataProvider = OnlineODataProvider(serviceName: "V2", serviceRoot: serviceRoot, sapURLSession: sapURLSession)
        // Disables version validation of the backend OData service
        #warning("Should only be used in demo and test applications")
        odataProvider.serviceOptions.checkVersion = false
        self.v2 = V2(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        self.v2.provider.networkOptions.tunneledMethods.append("MERGE")
    }
}
