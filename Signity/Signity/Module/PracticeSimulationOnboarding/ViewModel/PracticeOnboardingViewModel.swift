//
//  PracticeOnboardingViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 22/08/21.
//

import AVFoundation
import UIKit

class PracticeOnboardingViewModel: ObservableObject {
    @Published var cameraAuthorizationStatus: AVAuthorizationStatus
    
    init() {
        self.cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    func requestCameraAccess() {
        if cameraAuthorizationStatus == .denied {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        } else {
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.cameraAuthorizationStatus = .authorized
                    } else {
                        self.cameraAuthorizationStatus = .denied
                    }
                }
            }
        }
    }
}
