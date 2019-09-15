//
//  FelicaReader.swift
//  SuicaReader
//
//  Created by 伊藤凌也 on 2019/09/15.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import CoreNFC

final class FelicaReader: NSObject {

    var session: NFCTagReaderSession?

    func beginReadNFC() {
        self.session = NFCTagReaderSession(pollingOption: .iso18092, delegate: self)
        self.session?.alertMessage = "Felicaを近づけてください。(Suicaなど)"
        self.session?.begin()
    }
}

extension FelicaReader: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("active!!")
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("invalidate...")
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        tags.forEach { (tag) in
            switch tag {
            case .feliCa(let tag):
                print(String(data: tag.currentSystemCode, encoding: .utf8) ?? "nil")
                print(String(data: tag.currentIDm, encoding: .utf8) ?? "nil")
            default:
                break
            }
        }
    }
}
