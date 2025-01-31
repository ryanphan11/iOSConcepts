//
//  BLETableViewController.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/30/25.
//
import UIKit
import Foundation
import CoreBluetooth

class BLEVTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var bleManager = BLEManager()
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bleManager.onDevicesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func setupUI() {
        view.backgroundColor = .white
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bleManager.discoveredDevices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let device = bleManager.discoveredDevices[indexPath.row]
        cell.textLabel?.text = device.0.name ?? "Unknown Device"
        cell.detailTextLabel?.text = "RSSI: \(device.1)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let device = bleManager.discoveredDevices[indexPath.row].0
        bleManager.connectToDevice(device)
        print("Connecting to \(device.name ?? "Unknown")...")
    }
}
