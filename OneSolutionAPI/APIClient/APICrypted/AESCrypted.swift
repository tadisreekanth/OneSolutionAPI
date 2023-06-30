//
//  CryptedData.swift
//  OneSolution
//
//  Created by sreekanth reddy Tadi on 04/10/22.
//  Copyright © 2022 Sreekanth Reddy. All rights reserved.
//

import CryptoSwift

let AESkey = "AbcDefGhILmnoPQr"

extension Data {    
    var encryptedData: Data? {
        guard let str = String(data: self, encoding: .utf8) else {
            return self
        }
        guard let encrypted = str.trimmed.aesEncrypted else {
            return self
        }
        return encrypted.data(using: .utf8)
    }
    var decryptedData: Data? {
        guard let str = String (data: self, encoding: .utf8) else {
            return self
        }
        guard let decrypted = str.trimmed.aesDecrypted else {
            return self
        }
        return decrypted.data(using: .utf8)
    }
}


extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    var aesEncrypted: String? {
        
        let keyConv: [UInt8] = Array(AESkey.utf8) as [UInt8]
        
        guard let aes = try? AES(key: keyConv, blockMode: CBC (iv: keyConv) , padding:.pkcs5) else {
            return self // AES128 .ECB pkcs7
        }
        guard let encrypted = try? aes.encrypt(Array(self.utf8)) else {
            return self
        }
        return encrypted.toBase64()
    }
        
    var aesDecrypted: String? {
        
        let arr = Array.init(base64: self)
        
        let keyConv: [UInt8] = Array(AESkey.utf8) as [UInt8]
                
        guard let aes = try? AES(key: keyConv, blockMode: CBC (iv: keyConv), padding: .pkcs5) else {
            return self// AES128 .ECB pkcs7
        }
        guard let dec = try? aes.decrypt(arr) else {
            return self
        }
        return String (bytes: [UInt8](dec), encoding: .utf8) ?? self
    }
}
