//
//  CameraView.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct CameraRepresentable: UIViewControllerRepresentable {
    var addToLandmarkQueue: ([Double]) -> Void
    var processLandmarksHandler: ([Hand], _ highConfidenceLandmarks: Int) -> Void
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let cameraVC = CameraViewController()
        cameraVC.processLandmarksHandler = processLandmarksHandler
        cameraVC.addToLandmarkQueue = addToLandmarkQueue
        
        return cameraVC
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        
    }
}
