//
//  MicrophoneExtensions.swift
//  Plugin
//
//  Copyright © 2021 Max Lynch. All rights reserved.
//

import AVFoundation

internal protocol MicrophoneAuthorizationState {
    var authorizationState: String { get }
}

extension AVAuthorizationStatus : MicrophoneAuthorizationState {
    var authorizationState: String {
        switch self {
        case .denied, .restricted:
            return "denied"
        case .authorized:
            return "granted"
        case .notDetermined:
            fallthrough
        @unknown default:
            return "prompt"
        }
    }
}
