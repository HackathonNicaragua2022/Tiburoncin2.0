//
//  TabBarViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class TabBarViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var mainContainer: UIView!
    @IBOutlet var tabBarView: UIView!
    
    // MARK: - Stored Properties
    let viewModel: TabBarViewModel
    var isInitialLoad = true
    
    // MARK: - Initializers
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        tabBarView.setShadow()
        if isInitialLoad {
            viewModel.homeTabAction(mainContainer)
            isInitialLoad.toggle()
        }
    }
    
    // MARK: - IBActions
    @IBAction func didTapHome(_ sender: UIButton) {
        viewModel.homeTabAction(mainContainer)
    }
    
    @IBAction func didTapSearch(_ sender: UIButton) {
        viewModel.searchTabAction(mainContainer)
    }
    
    @IBAction func didTapMiddle(_ sender: UIButton) {
    }
    
    @IBAction func didTapMessages(_ sender: UIButton) {
        viewModel.messageTabAction(mainContainer)
    }
    
    @IBAction func didTapProfile(_ sender: UIButton) {
        viewModel.profileTabAction(mainContainer)
    }
}
