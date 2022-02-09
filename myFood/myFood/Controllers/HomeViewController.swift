//
//  ViewController.swift
//  myFood
//
//  Created by Grazielli Berti on 31/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Variable
    var viewModelCategory =  CategoryListViewModel()
    var viewModelRestarant = RestaurantListViewModel()
    let cellHeight: CGFloat = 70
    
    //MARK: - View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Nome do Restaurante"
        return searchBar
    }()
    
    let labelAdress: UILabel = {
        let label = UILabel()
        label.text = "Praça Roberto Gomes Pedrosa, 1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 14 : 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray6
            collectionView.register(CategoryFoodCollectionViewCell.self,
                                    forCellWithReuseIdentifier: CategoryFoodCollectionViewCell.identifier)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(RestaurantsListTableViewCell.self, forCellReuseIdentifier: RestaurantsListTableViewCell.reuseIdentifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigation()
        setupView()
        setupContrains()
        bindUI()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    fileprivate func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(labelAdress)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(tableView)
    }
    
    fileprivate func setupContrains() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            labelAdress.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            labelAdress.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: labelAdress.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5),
            collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            tableView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    fileprivate func bindUI() {
    }
    
    fileprivate func setupNavigation() {
        self.navigationItem.title = "MyFood App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        UINavigationBar.appearance().isTranslucent = false
        
        let app = UINavigationBarAppearance()
        
        let navigationBar = self.navigationController?.navigationBar
        
        app.backgroundColor = .clear
        app.configureWithOpaqueBackground()
        app.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        app.backgroundColor = .systemGroupedBackground
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        
        navigationBar!.standardAppearance = app
        navigationBar!.scrollEdgeAppearance = app
        
        let search = UISearchController(searchResultsController: nil)
        //        search.searchBar.delegate = self
        search.searchResultsUpdater = self as? UISearchResultsUpdating
        search.searchBar.placeholder = "Nome do Restaurante"
        search.searchBar.searchTextField.tintColor = UIColor.gray
        search.searchBar.setImage(UIImage(named: "magnifyingglass")?.withTintColor(UIColor.systemGray), for: .search, state: .normal)
        
        self.navigationItem.searchController = search
    }
    
    @objc func didTapButtonEdition() {
        let editAdress = EditAdressViewController()
        self.navigationController?.pushViewController(editAdress, animated: true)
    }
}
//MARK: - UICollectionView: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

//MARK: - UICollectionView: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelCategory.fetchCategoryList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFoodCollectionViewCell.identifier, for: indexPath) as! CategoryFoodCollectionViewCell
        let category = viewModelCategory.fetchCategoryList()[indexPath.row]
        cell.configure(for: category)

        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
//MARK: - UITableView: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}
//MARK: - UITableView: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelRestarant.fetchRestaurantList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantsListTableViewCell.reuseIdentifier, for: indexPath) as? RestaurantsListTableViewCell else { return UITableViewCell() }
        cell.config(for: viewModelRestarant.fetchRestaurantList()[indexPath.row])
        return cell
    }
}
