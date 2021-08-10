//
//  CameraViewController.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import UIKit
import AVFoundation
import Vision

class CameraViewController: UIViewController {
    let session = AVCaptureSession()
    var camera: AVCaptureDevice!
    var videoDataOutput: AVCaptureVideoDataOutput!
    var videoDataOutputQueue: DispatchQueue!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var previewView: UIView!
    
    var processLandmarksHandler: (([Hand], _ highConfidenceLandmarks: Int) -> Void)?
    var addToLandmarkQueue: (([Double]) -> Void)?
    
    private let videoOutputQueue = DispatchQueue(label: "VideoOutput", qos: .userInteractive)
    
    private let handPoseRequest: VNDetectHumanHandPoseRequest = {
        let request = VNDetectHumanHandPoseRequest()
        request.maximumHandCount = 2
        
        return request
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewView = UIView(frame: CGRect(x: 0,
                                           y: 0,
                                           width: view.bounds.width,
                                           height: view.bounds.height))
        previewView.contentMode = UIView.ContentMode.scaleAspectFit
        view.addSubview(previewView)
        
        self.setupCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        session.stopRunning()
        super.viewDidAppear(animated)
    }
    
    func setupCamera() {
        self.session.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        guard let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: .video, position: .front) else {
            return
        }
        
        self.camera = device
        self.setupSession()
    }
    
    func setupSession() {
        var deviceInput: AVCaptureDeviceInput!
        
        do {
            deviceInput = try AVCaptureDeviceInput(device: self.camera)
            guard deviceInput != nil else {
                print("Could not initialize device input")
                return
            }
            
            if self.session.canAddInput(deviceInput) {
                self.session.addInput(deviceInput)
            }
            
            self.videoDataOutput = AVCaptureVideoDataOutput()
            self.videoDataOutput.alwaysDiscardsLateVideoFrames = true
            self.videoDataOutputQueue = DispatchQueue(label: "VideoDataOutputQueue")
            self.videoDataOutput.setSampleBufferDelegate(self, queue: self.videoDataOutputQueue)
            
            if self.session.canAddOutput(self.videoDataOutput) {
                self.session.addOutput(self.videoDataOutput)
            }
            self.videoDataOutput.connection(with: .video)?.isEnabled = true
            
            self.previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
            self.previewLayer.videoGravity = .resizeAspectFill
            
            self.previewView.layer.masksToBounds = true
            previewLayer.frame = self.previewView.layer.bounds
            self.previewView.layer.addSublayer(self.previewLayer)
            self.session.startRunning()
        } catch {
            
        }
    }
}

extension CameraViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
        
        var hands = [Hand]()
        var highConfidenceLandmarks = 0

        var leftHand: [Double] = Array(repeating: -1, count: 63)
        var rightHand: [Double] = Array(repeating: -1, count: 63)
        var currentLandmarks = [Double]()
        
        do {
            try handler.perform([handPoseRequest])

            if let results = handPoseRequest.results {
                try results.forEach { observation in
                    let processedData = self.createHandModel(from: observation)
                    hands.append(processedData.createdModel)
                    
                    highConfidenceLandmarks += processedData.highConfidenceLandmarks
                    
                    let keypoints = try! observation.keypointsMultiArray()
                    let wristPoint = try observation.recognizedPoint(.wrist)
                    let thumbPoint = try observation.recognizedPoint(.thumbTip)
                    
                    let thumbTip = self.previewLayer.captureDevicePointConverted(fromLayerPoint: thumbPoint.location)
                    let wrist = self.previewLayer.captureDevicePointConverted(fromLayerPoint: wristPoint.location)
                    
                    if let buff = try? UnsafeBufferPointer<Double>(keypoints) {
                        let arr = Array(buff)
                        
                        if wrist.x > thumbTip.x {
                            leftHand = arr
                        } else {
                            rightHand = arr
                        }
                    }
                }
                
                currentLandmarks = leftHand + rightHand
                self.addToLandmarkQueue!(currentLandmarks)
            }

        } catch {
            
        }
        
        DispatchQueue.main.async {
            self.processLandmarksHandler!(hands, highConfidenceLandmarks)
        }
    }
    
    func processPoint(for point: VNRecognizedPoint) -> CGPoint {
        let viewPoint = CGPoint(x: point.location.x, y: 1 - point.location.y)
        let convertedPoint = self.previewLayer.layerPointConverted(fromCaptureDevicePoint: viewPoint)
        
        return convertedPoint
    }

}
