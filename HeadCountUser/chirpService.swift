//
//  chirpService.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 01/02/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import ChirpSDK

protocol ChirpDelegate {
    func onReceived(data: Data?)
    func onSent(data: Data?)
}
var sdk: ChirpSDK?
class ChirpService {
    var delegate: ChirpDelegate?
    

    public init() {
        sdk = ChirpSDK(appKey: CHIRP_APP_KEY, andSecret: CHIRP_APP_SECRET)
        if let sdk = sdk {
            sdk.setConfig(CHIRP_APP_CONFIG)
            sdk.start()

            sdk.receivedBlock = {
                (data: Data?, channel: UInt?) -> () in
                if let delegate = self.delegate {
                    delegate.onReceived(data: data)
                }
                return;
            }

            sdk.sentBlock = {
                (data: Data?, channel: UInt?) -> () in
                if let delegate = self.delegate {
                    delegate.onSent(data: data)
                }
                return;
            }
        }
    }
}
let CHIRP_APP_KEY: String = "1E0fBB90EcC17B1E8Dc0DcDDC";
let CHIRP_APP_SECRET: String = "46c8302bb31ef25e2DcAAf5F777CDECCAcEbB0e9657cDAf3Ef";
let CHIRP_APP_CONFIG: String = "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";
