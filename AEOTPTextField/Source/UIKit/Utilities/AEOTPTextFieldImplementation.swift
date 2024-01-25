//
//  AEOTPTextFieldImplementation.swift
//  ViberTemplate
//
//  Created by Abdelrhman Eliwa on 09/05/2021.
//

import UIKit

class AEOTPTextFieldImplementation: NSObject, UITextFieldDelegate {
    weak var implementationDelegate: AEOTPTextFieldImplementationProtocol?

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if let delegate = self.implementationDelegate {
            switch delegate.allowingInput {
            case .AlphaNumeric:
                let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
                return isInputValid(for: string, allowedCharacters: allowedCharacters, textField: textField, range: range)
            }
        }
        return false // You might want to handle other cases or return a default value
    }
    
    private func isInputValid(for string: String, allowedCharacters: CharacterSet, textField: UITextField, range: NSRange) -> Bool {
        let characterSet = CharacterSet(charactersIn: string)
        
        // Check if the entered characters are allowed
        let isAllowed = allowedCharacters.isSuperset(of: characterSet)
        
        // Additional logic for character count restriction
        guard let text = textField.text else { return false }
        let newLength = text.count + string.count - range.length
        let isWithinCharacterLimit = newLength <= implementationDelegate?.digitalLabelsCount ?? 0
        
        // Return true only if both conditions are met
        return isAllowed && isWithinCharacterLimit
    }
}
