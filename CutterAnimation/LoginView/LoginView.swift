//
//  LoginView.swift
//  KYCTest
//
//  Created by Emiray on 13.04.2021.
//

import UIKit

class LoginView: UIView {

    @IBOutlet var contentView: UIView!
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    // MARK: - Views Setup
    func loadView() {
        let bundle = Bundle(for: LoginView.self)
        let nib = UINib(nibName: "LoginView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.layer.cornerRadius = 6.0
        addSubview(view)
    }

}
