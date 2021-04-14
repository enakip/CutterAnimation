//
//  ViewController.swift
//  CutterAnimation
//
//  Created by Emiray Nakip on 14.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonLogin : UIButton = UIButton()
    
    var buttonCloseX : UIButton = UIButton()
    
    var viewTop : UIView = UIView()
    var heightConstraintViewTop : NSLayoutConstraint!
    
    var viewBottom : UIView = UIView()
    var heightConstraintViewBottom : NSLayoutConstraint!
    
    var loginView : LoginView = LoginView()
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayouts()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.animationCollectAtTheCenter()
    }
    
    // MARK: - SETUP UI
    private func setupLayouts() {
        self.setupLayoutButtonLogin()
        self.setupLayoutViewTop()
        self.setupLayoutViewBottom()
        self.setupLayoutLoginView()
        self.setupLayoutButton()
    }
    
    private func setupLayoutViewTop() {
        
        viewTop.backgroundColor = .black
        viewTop.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTop)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        self.heightConstraintViewTop = viewTop.heightAnchor.constraint(equalToConstant: 0.0)
        
        NSLayoutConstraint.activate([
            viewTop.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewTop.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            viewTop.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.heightConstraintViewTop
        ])
        
    }
    
    private func setupLayoutViewBottom() {
        viewBottom.backgroundColor = .red
        viewBottom.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewBottom)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        self.heightConstraintViewBottom = viewBottom.heightAnchor.constraint(equalToConstant: 0.0)
        
        NSLayoutConstraint.activate([
            viewBottom.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewBottom.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            viewBottom.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.heightConstraintViewBottom
        ])
    }
    
    private func setupLayoutButtonLogin() {
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = .red
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.layer.cornerRadius = 6.0
        buttonLogin.addTarget(self, action: #selector(actionButtonTapLogin), for: .touchUpInside)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonLogin)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            buttonLogin.heightAnchor.constraint(equalToConstant: 40.0),
            buttonLogin.widthAnchor.constraint(equalToConstant: 150.0),
            buttonLogin.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            buttonLogin.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0.0)
        ])
    }
    
    private func setupLayoutButton() {
        buttonCloseX.setTitle("X", for: .normal)
        buttonCloseX.backgroundColor = .white
        buttonCloseX.setTitleColor(.brown, for: .normal)
        buttonCloseX.layer.cornerRadius = 15.0
        buttonCloseX.addTarget(self, action: #selector(actionButtonTapX), for: .touchUpInside)
        buttonCloseX.isHidden = true
        buttonCloseX.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonCloseX)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            buttonCloseX.heightAnchor.constraint(equalToConstant: 30.0),
            buttonCloseX.widthAnchor.constraint(equalToConstant: 30.0),
            buttonCloseX.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5.0),
            buttonCloseX.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5.0)
        ])
    }
    
    private func setupLayoutLoginView() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.alpha = 0.0
        view.addSubview(loginView)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            loginView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            loginView.widthAnchor.constraint(equalToConstant: 300.0),
            loginView.heightAnchor.constraint(equalToConstant: 172.0)
        ])
    }
    
    // MARK: - ANIMATIONS
    @objc func animationCollectAtTheCenter() {
        UIView.animate(withDuration: 0.6) {  [weak self] in
            guard let self = self else { return }
            self.heightConstraintViewTop.constant = self.view.frame.height/2
            self.heightConstraintViewBottom.constant = self.view.frame.height/2
            self.view.layoutIfNeeded()
        } completion: { (done) in
            if done {
                self.buttonCloseX.isHidden = false
                
                self.animateLoginView()
            }
        }
    }
    
    @objc func animationSeperate() {
        UIView.animate(withDuration: 0.6) {  [weak self] in
            guard let self = self else { return }
            self.heightConstraintViewTop.constant = 0.0
            self.heightConstraintViewBottom.constant = 0.0
            self.buttonCloseX.isHidden = true
            self.loginView.alpha = 0.0
            self.view.layoutIfNeeded()
        }
    }
    
    func animateLoginView() {
        
        loginView.transform = CGAffineTransform(scaleX: 4, y: 4)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.loginView.alpha = 1
            self.loginView.transform = CGAffineTransform.identity
        }
        
    }
    
    // MARK: - ACTIONS
    @objc private func actionButtonTapX() {
        self.animationSeperate()
    }
    
    @objc private func actionButtonTapLogin() {
        self.animationCollectAtTheCenter()
    }
    
}

