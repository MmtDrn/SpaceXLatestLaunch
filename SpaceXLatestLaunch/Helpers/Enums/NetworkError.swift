//
//  NetworkError.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import Foundation

enum NetworkError {
    case noError
    case credentialsWrong
    case notConnectedInternet
    case serviceResponseFailed
    case conflictCredentials
    case emptyOrNil
    case authenticationLocked
    case notValidOtpCode
    case redirectAuth

    var errorMessage: String {
        switch self {
        case .noError:
            return "Veri bulunamadı"
        case .credentialsWrong:
            return "Kullanıcı adı veya parola yanlış"
        case .notConnectedInternet:
            return "İnternet bağlantısı yok"
        case .serviceResponseFailed:
            return "Servis yanıtı alınamadı"
        case .conflictCredentials:
            return "Çakışan kimlik bilgileri"
        case .emptyOrNil:
            return "Boş veya nil değer"
        case .authenticationLocked:
            return "Kimlik doğrulama kilitlendi"
        case .notValidOtpCode:
            return "Geçersiz OTP kodu"
        case .redirectAuth:
            return "Yönlendirme kimlik doğrulama gerektiriyor"
        }
    }
}

