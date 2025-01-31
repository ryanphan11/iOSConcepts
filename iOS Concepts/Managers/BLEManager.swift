//
//  BLEManager.swift
//  iOS Concepts
//
//  Created by Ryan Phan on 1/30/25.
//

import Foundation
import CoreBluetooth

class BLEManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var centralManager: CBCentralManager!
    var discoveredPeripheral: CBPeripheral?
    var discoveredDevices: [(CBPeripheral, NSNumber)] = []
    var onDevicesUpdated: (() -> Void)?

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Bluetooth is ON. Scanning for devices...")
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            print("Bluetooth not available")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        if !discoveredDevices.contains(where: { $0.0.identifier == peripheral.identifier }) {
            discoveredDevices.append((peripheral, RSSI))
            onDevicesUpdated?()
        }
    }

    func connectToDevice(_ peripheral: CBPeripheral) {
        centralManager.stopScan()
        discoveredPeripheral = peripheral
        discoveredPeripheral?.delegate = self
        centralManager.connect(peripheral, options: nil)
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "Unknown Device")")
        peripheral.discoverServices(nil)
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                print("Found Service: \(service.uuid)")
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print("Found Characteristic: \(characteristic.uuid)")

                if characteristic.properties.contains(.read) {
                    peripheral.readValue(for: characteristic)
                }
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let value = characteristic.value {
            print("Received Data: \(value)")
        }
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from \(peripheral.name ?? "Device")")
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
}

