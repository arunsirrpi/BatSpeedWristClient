//
//  DeviceMotion.swift
//  Bat Speed
//
//  Created by Arun Sirrpi on 10/4/21.
//

import Foundation
import CoreMotion
import SwiftUI

/**
 Main class that is responsible for fetching the data from the
 device acceleormeters
 */
final class DeviceMotion: ObservableObject {
    public typealias Acceleration = (x: Double, y: Double, z: Double)
    private let device = CMMotionManager()
    private let processingQue = OperationQueue()
    
    @Published private(set) var acceleration: Acceleration = (x: 0, y: 0, z: 0)
}

extension DeviceMotion {
    /// Start Getting the data form the
    func startTracking() -> Bool {
        guard device.isAccelerometerAvailable else {
            return false
        }
        device.startAccelerometerUpdates(to: processingQue) { [weak self] (data, error) in
            guard let uData = data else {
                return
            }
            self?.acceleration = (
                x: uData.acceleration.x,
                y: uData.acceleration.y,
                z: uData.acceleration.z
            )
        }
        return true
    }
    
    func stopTracking() {
        guard device.isAccelerometerActive else {
            return
        }
        device.stopAccelerometerUpdates()
    }
}
