//
//  MovieFeedViewController.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Dip_UI

class MovieFeedViewController: UIViewController {

    @IBOutlet weak var tblMovies: UITableView!
    
    var presenter: MovieFeedModuleInterface! = nil {
        didSet {
            configure()
        }
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMovies.register(UINib(nibName:MovieTableViewCell.identifier , bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
        configure()
    }
    
    private func configure() {
        guard presenter != nil && isViewLoaded else { return }
        
        presenter.displayMovies()
        prepareCollection()
    }
    
    private func prepareCollection() {
        
        presenter.itemsSequence.bind(to: tblMovies.rx.items(cellIdentifier: MovieTableViewCell.identifier, cellType: MovieTableViewCell.self)) { (_, element: MovieCellViewModel, cell: MovieTableViewCell) in
            cell.configure(viewModel: element)
            }
            .disposed(by: disposeBag)
        
        tblMovies.rx.itemSelected.asObservable().subscribe(onNext: { (index) in
            self.presenter.didSelectItemAtIndex(index: index.row)
        }).disposed(by: disposeBag)
    }
}



//MARK: - HerbsGalleryViewProtocol's implementation
extension MovieFeedViewController: MovieFeedViewInput {
    func displayLoadingProgress() {
        tblMovies.displayActivityIndicator()
    }
    
    func hideLoadingProgress() {
        tblMovies.hideActivityIndicator()
    }
    
    func didReceiveItems(items: [MovieCellViewModel]) {
        debugPrint(#function)
    }
}

extension MovieFeedViewController: StoryboardInstantiatable { }
