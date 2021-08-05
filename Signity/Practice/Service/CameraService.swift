//
//  CameraService.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import AVFoundation

class CameraService {
    
    
    func checkForPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                break
            case .notDetermined:
                break
            default:
                break
        }
    }
}
