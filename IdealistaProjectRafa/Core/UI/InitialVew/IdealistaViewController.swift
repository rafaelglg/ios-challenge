//
//  IdealistaViewController.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import UIKit
import SwiftUI

final class IdealistaViewController: UIViewController {
    
    let viewModel: IdealistaViewModel
    private var showListButton: UIButton!
    
    init(viewModel: IdealistaViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setUpButton() {
        showListButton = UIButton(type: .system)
        showListButton.setTitle("Show ads list", for: .normal)
        
        let action = UIAction { [weak self] _ in
            self?.didTapShowList()
        }
        
        showListButton.addAction(action, for: .touchUpInside)
        
        showListButton.layer.cornerRadius = 12
        showListButton.layer.borderWidth = 2
        showListButton.layer.borderColor = UIColor.label.cgColor
        showListButton.backgroundColor = UIColor.tertiarySystemBackground
        showListButton.setTitleColor(UIColor.label, for: .normal)
        
        showListButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showListButton)
        
        NSLayoutConstraint.activate([
            showListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showListButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showListButton.heightAnchor.constraint(equalToConstant: 50),
            showListButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func didTapShowList() {
        showList()
    }
    
    func showList() {
        let viewController = UIHostingController(rootView: IdealistaListView(viewModel: viewModel))
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
