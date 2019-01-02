// SPDX-License-Identifier: MIT
// Copyright © 2018 WireGuard LLC. All Rights Reserved.

import Cocoa

class KeyValueCell: NSView {
    let keyLabel: NSTextField = {
        let keyLabel = NSTextField()
        keyLabel.isEditable = false
        keyLabel.isSelectable = false
        keyLabel.isBordered = false
        keyLabel.alignment = .right
        keyLabel.maximumNumberOfLines = 1
        keyLabel.lineBreakMode = .byTruncatingTail
        keyLabel.backgroundColor = .clear
        return keyLabel
    }()

    let valueLabel: NSTextField = {
        let valueLabel = NSTextField()
        valueLabel.isEditable = false
        valueLabel.isSelectable = true
        valueLabel.isBordered = false
        valueLabel.maximumNumberOfLines = 1
        valueLabel.lineBreakMode = .byTruncatingTail
        valueLabel.backgroundColor = .clear
        return valueLabel
    }()

    var key: String {
        get { return keyLabel.stringValue }
        set(value) { keyLabel.stringValue = value }
    }
    var value: String {
        get { return valueLabel.stringValue }
        set(value) { valueLabel.stringValue = value }
    }
    var isKeyInBold: Bool {
        get { return keyLabel.font == NSFont.boldSystemFont(ofSize: 0) }
        set(value) {
            if value {
                keyLabel.font = NSFont.boldSystemFont(ofSize: 0)
            } else {
                keyLabel.font = NSFont.systemFont(ofSize: 0)
            }
        }
    }

    init() {
        super.init(frame: CGRect.zero)

        addSubview(keyLabel)
        addSubview(valueLabel)
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            keyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            keyLabel.firstBaselineAnchor.constraint(equalTo: valueLabel.firstBaselineAnchor),
            self.leadingAnchor.constraint(equalTo: keyLabel.leadingAnchor),
            keyLabel.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -5),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            keyLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        key = ""
        value = ""
        isKeyInBold = false
    }
}
