//
//  RecipesViewController.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import UIKit
import Domain

class RecipesViewController: UIViewController, Bindable {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyStateView: EmptyStateView!
    
    @IBOutlet weak var recipesTableView: UITableView! {
        didSet {
            recipesTableView.dataSource = self
            recipesTableView.register(UINib(nibName: RecipeTableViewCell.className,
                                     bundle: Bundle(for: type(of: self))),
                               forCellReuseIdentifier: RecipeTableViewCell.className)
        }
    }
    
    private var recipes: [Recipe] {
        return viewModel.recipes
    }
    
    let viewModel: RecipesViewModel
    
    init(viewModel: RecipesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        bindViewModel()
        viewModel.fetchNewRecipes()
    }
    
    private func setUpView() {
        activityIndicator.startAnimating()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(userDidTapSortDidButton))
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
    }
    
    @objc private func userDidTapSortDidButton() {
        viewModel.sortDidTap()
    }
    
    func bindViewModel() {
        viewModel.didObserveOrderedItems = { [weak self] in
            guard let self = self else { return }
            self.recipesTableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) { [weak self] in
                self?.recipesTableView.scrollToRow(at: .zero, at: .top, animated: true)
            }
        }
        
        viewModel.didObserveNewItems = { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.emptyStateView.isHidden = true
            self.recipesTableView.isHidden = false
            self.recipesTableView.reloadData()
        }
        
        viewModel.didObserveError = { [weak self] error in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.recipesTableView.isHidden = true
            self.emptyStateView.isHidden = false
            self.emptyStateView.text = error.localizedDescription
        }
        
        emptyStateView.didTap = { [weak self] in
            self?.activityIndicator.startAnimating()
            self?.viewModel.fetchNewRecipes()
        }
    }
}

extension RecipesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.className) as! RecipeTableViewCell
        cell.recipe = recipes[indexPath.row]
        
        if indexPath.row == recipes.count - 1 {
            viewModel.fetchNewRecipes()
        }
        
        return cell
    }
    
    
}
