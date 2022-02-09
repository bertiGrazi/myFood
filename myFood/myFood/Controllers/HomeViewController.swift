//
//  ViewController.swift
//  myFood
//
//  Created by Grazielli Berti on 31/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Variable
    var viewModel =  CategoryListViewModel()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigation()
        setupView()
        setupContrains()
        bindUI()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    fileprivate func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(labelAdress)
        scrollView.addSubview(collectionView)
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

}

//MARK: - UICollectionView: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.fetchCategoryList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFoodCollectionViewCell.identifier, for: indexPath) as! CategoryFoodCollectionViewCell
        let category = viewModel.fetchCategoryList()[indexPath.row]
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
