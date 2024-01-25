//
//  AEOTPTextFieldImplementationProtocol.swift
//  AEOTPTextField-SwiftUI
//
//  Created by Abdelrhman Eliwa on 01/06/2022.
//

public enum CharSetType {
    case AlphaNumeric
}

protocol AEOTPTextFieldImplementationProtocol: AnyObject {
    var digitalLabelsCount: Int { get }
    var allowingInput: CharSetType { get }
}
