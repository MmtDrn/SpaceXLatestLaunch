//
//  SpaceXLatestLaunchTests.swift
//  SpaceXLatestLaunchTests
//
//  Created by mehmet duran on 29.09.2023.
//

import XCTest
@testable import SpaceXLatestLaunch

final class SpaceXLatestLaunchTests: XCTestCase {
    
    var viewModel: HomeVM!
    var networking: MockNetworking!
    var mockHomeVC: MockHomeVC!
    var mockTableView: UITableView!

    override func setUpWithError() throws {
        networking = .init()
        viewModel = .init(networking: networking)
        mockHomeVC = .init(viewModel: viewModel)
        
        mockTableView = .init()
        mockTableView.register(MainCell.self, forCellReuseIdentifier: MainCell.description())
        mockTableView.register(CommonCell.self, forCellReuseIdentifier: CommonCell.description())
    }

    override func tearDownWithError() throws {
        viewModel = nil
        networking = nil
        mockHomeVC = nil
    }
    
    func testFetchLastLaunches_whenSuccess() {
        let mockModel = LatestLaunchesModel()
        networking.result = (mockModel, nil)
        viewModel.fetchLatestLaunches()
        
        XCTAssertTrue(mockHomeVC.fetchSuccess)
    }
    
    func testFetchLastLaunches_whenFailure() {
        let mockModel = MockDecodableModel()
        networking.result = (mockModel, nil)
        
        viewModel.fetchLatestLaunches()
        
        XCTAssertFalse(mockHomeVC.fetchSuccess)
    }
    
    func testFetchCrew_whenSuccess() {
        let mockModel = CrewModel()
        viewModel.launchesModel = .init(crew: ["1111"])
        networking.result = (mockModel, nil)
        
        viewModel.fetchCrew()
        
        XCTAssertTrue(mockHomeVC.crewFetchSuccess)
    }
    
    func testFetchCrew_whenFailure() {
        let mockModel = MockDecodableModel()
        viewModel.launchesModel = .init(crew: ["1111"])
        networking.result = (mockModel, nil)
        
        viewModel.fetchCrew()
        
        XCTAssertFalse(mockHomeVC.crewFetchSuccess)
    }
    
    func testFetchRocket_whenSuccess() {
        let mockModel = RocketModel()
        viewModel.launchesModel = .init(rocket: "1111")
        networking.result = (mockModel, nil)
        
        viewModel.fetchRocket()
        
        XCTAssertTrue(mockHomeVC.rocketFetchSuccess)
    }
    
    func testFetchRocket_whenFailure() {
        let mockModel = MockDecodableModel()
        viewModel.launchesModel = .init(rocket: "1111")
        networking.result = (mockModel, nil)
        
        viewModel.fetchRocket()
        
        XCTAssertFalse(mockHomeVC.rocketFetchSuccess)
    }
    
    func testFetcLaunchpad_whenSuccess() {
        let mockModel = LaunchPadsModel()
        viewModel.launchesModel = .init(launchPad: "1111")
        networking.result = (mockModel, nil)
        
        viewModel.fetchLaunchpad()
        
        XCTAssertTrue(mockHomeVC.launchpadFetchSuccess)
    }
    
    func testFetcLaunchpad_whenFailure() {
        let mockModel = MockDecodableModel()
        viewModel.launchesModel = .init(launchPad: "1111")
        networking.result = (mockModel, nil)
        
        viewModel.fetchLaunchpad()
        
        XCTAssertFalse(mockHomeVC.launchpadFetchSuccess)
    }
    
    func testDS_numberOfSections() {
        let numberOfSections = viewModel.dataSource.numberOfSections(in: mockTableView)
        
        XCTAssertEqual(numberOfSections, LaunchCases.allCases.count)
    }
    
    func testDS_numberOfRowsInSection() {
        let numberOfRowsInSection = viewModel.dataSource.tableView(mockTableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRowsInSection, 1)
    }
    
    func testDS_cellForRowAt_MainCell() {
        let mockIndexPath = IndexPath(row: 0, section: 0)
        let cell = viewModel.dataSource.tableView(mockTableView, cellForRowAt: mockIndexPath)
        
        XCTAssertTrue(cell is MainCell)
    }
    
    func testDS_cellForRowAt_CommonCell() {
        let mockIndexPath = IndexPath(row: 0, section: 2)
        let cell = viewModel.dataSource.tableView(mockTableView, cellForRowAt: mockIndexPath)
        
        XCTAssertTrue(cell is CommonCell)
    }
    
    func testDS_heightForRowAt() {
        let mockIndexPath = IndexPath(row: 0, section: 0)
        let heightForRowAt = viewModel.dataSource.tableView(mockTableView, heightForRowAt: mockIndexPath)
        
        XCTAssertEqual(heightForRowAt, .setPadding(.height(250)))
    }
}
