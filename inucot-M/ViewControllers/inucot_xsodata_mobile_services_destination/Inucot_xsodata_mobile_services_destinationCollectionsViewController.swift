//
// inucot-M
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 20/07/20
//

import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData

protocol Inucot_xsodata_mobile_services_destinationEntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol Inucot_xsodata_mobile_services_destinationEntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class Inucot_xsodata_mobile_services_destinationCollectionsViewController: FUIFormTableViewController {
    private var collections = Inucot_xsodata_mobile_services_destinationCollectionType.all
    let destinations = FileConfigurationProvider("AppParameters").provideConfiguration().configuration["Destinations"] as! NSDictionary

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper
    private func collectionSelected(at indexPath: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard"
        var masterViewController: UIViewController!
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[destinations["inucot_xsodata_mobile_services_destination"] as! String] as? Inucot_xsodata_mobile_services_destinationOnlineODataController, let v2 = odataController.v2 else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }
        self.selectedIndex = indexPath

        switch self.collections[indexPath.row] {
        case .location:
            let locationTypeStoryBoard = UIStoryboard(name: "LocationType", bundle: nil)
            let locationTypeMasterViewController = locationTypeStoryBoard.instantiateViewController(withIdentifier: "LocationTypeMaster") as! LocationTypeMasterViewController
            locationTypeMasterViewController.v2 = v2
            locationTypeMasterViewController.entitySetName = "Location"
            func fetchLocation(_ completionHandler: @escaping ([LocationType]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    v2.fetchLocation(matching: query, completionHandler: completionHandler)
                }
            }
            locationTypeMasterViewController.loadEntitiesBlock = fetchLocation
            locationTypeMasterViewController.navigationItem.title = "LocationType"
            masterViewController = locationTypeMasterViewController
        case .visit:
            let visitTypeStoryBoard = UIStoryboard(name: "VisitType", bundle: nil)
            let visitTypeMasterViewController = visitTypeStoryBoard.instantiateViewController(withIdentifier: "VisitTypeMaster") as! VisitTypeMasterViewController
            visitTypeMasterViewController.v2 = v2
            visitTypeMasterViewController.entitySetName = "Visit"
            func fetchVisit(_ completionHandler: @escaping ([VisitType]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    v2.fetchVisit(matching: query, completionHandler: completionHandler)
                }
            }
            visitTypeMasterViewController.loadEntitiesBlock = fetchVisit
            visitTypeMasterViewController.navigationItem.title = "VisitType"
            masterViewController = visitTypeMasterViewController
        case .visitor:
            let visitorTypeStoryBoard = UIStoryboard(name: "VisitorType", bundle: nil)
            let visitorTypeMasterViewController = visitorTypeStoryBoard.instantiateViewController(withIdentifier: "VisitorTypeMaster") as! VisitorTypeMasterViewController
            visitorTypeMasterViewController.v2 = v2
            visitorTypeMasterViewController.entitySetName = "Visitor"
            func fetchVisitor(_ completionHandler: @escaping ([VisitorType]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    v2.fetchVisitor(matching: query, completionHandler: completionHandler)
                }
            }
            visitorTypeMasterViewController.loadEntitiesBlock = fetchVisitor
            visitorTypeMasterViewController.navigationItem.title = "VisitorType"
            masterViewController = visitorTypeMasterViewController
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        guard let odataController = OnboardingSessionManager.shared.onboardingSession?.odataControllers[destinations["inucot_xsodata_mobile_services_destination"] as! String] as? Inucot_xsodata_mobile_services_destinationOnlineODataController else {
            AlertHelper.displayAlert(with: "OData service is not reachable, please onboard again.", error: nil, viewController: self)
            return
        }

        if self.splitViewController!.isCollapsed || odataController.v2 == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
