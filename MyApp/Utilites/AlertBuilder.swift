//
//  AlertBuilder.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//

import Foundation
import UIKit

class AlertBuilder {
    private var style: UIAlertController.Style
    private var title: String? = nil
    private var message: String? = nil
    private var actions: [UIAlertAction] = [UIAlertAction]()

    init(style: UIAlertController.Style = .alert) { self.style = style }

    func setTitle(_ title: String?) -> AlertBuilder {
        self.title = title
        return self
    }
    func setMessage(_ message: String?) -> AlertBuilder {
        self.message = message
        return self
    }

    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? ) -> AlertBuilder {
        addAction(UIAlertAction(title: title, style: style, handler: handler))
    }

    private func addAction(_ action: UIAlertAction) -> AlertBuilder {
        self.actions.append(action)
        return self
    }

    func build() -> UIAlertController {
        let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: self.style)
        actions.forEach{ alert.addAction($0) }
        return alert
    }

}
