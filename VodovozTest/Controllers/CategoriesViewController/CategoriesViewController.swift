//
//  ViewController.swift
//  VodovozTest
//
//  Created by Азат on 08.08.2024.
//

import UIKit
import Foundation
import Kingfisher


func fetchData(completion: @escaping (Result<Response, Error>) -> Void) {
    let urlString = "https://szorin.vodovoz.ru/newmobile/glavnaya/super_top.php?action=topglav"
    
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            return
        }
        
        do {
            let responseObject = try JSONDecoder().decode(Response.self, from: data)
            completion(.success(responseObject))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}

struct Response: Codable {
    let status, message: String
    let tovary: [Tovary]

    enum CodingKeys: String, CodingKey {
        case status, message
        case tovary = "TOVARY"
    }
}

struct TovaryResponse: Codable {
    let status, message: String
    let tovary: [Tovary]

    enum CodingKeys: String, CodingKey {
        case status, message
        case tovary = "TOVARY"
    }
}

struct Tovary: Codable {
    let id: Int
    let name: String
    let data: [Product]

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "NAME"
        case data
    }
}

struct Product: Codable {
    let id, iblockID: String
    let name, dateActiveFrom: String?
    let detailPicture: String?
    let propertyNewproductValue, propertyNewproductEnumID, propertyNewproductValueID, propertyPodarokValue: JSONNull?
    let propertyPodarokEnumID, propertyPodarokValueID, propertySaleleaderValue, propertySaleleaderEnumID: JSONNull?
    let propertySaleleaderValueID: JSONNull?
    let propertyTsenaZaEdinitsuTovaraValue: Int
    let propertyTsenaZaEdinitsuTovaraValueID: String
    let propertyRatingValue: Double
    let propertyRatingValueID: String?
    let catalogQuantity: Int
    let catalogQuantityTrace: CATALOGAVAILABLEEnum
    let catalogQuantityTraceOrig: CATALOGCANBUYZEROORIGEnum
    let catalogWeight, catalogVatID: String
    let catalogVatIncluded, catalogCanBuyZero: CATALOGAVAILABLEEnum
    let catalogCanBuyZeroOrig: CATALOGCANBUYZEROORIGEnum
    let catalogPurchasingPrice, catalogPurchasingCurrency: String?
    let catalogQuantityReserved: String
    let catalogSubscribe: CATALOGAVAILABLEEnum
    let catalogSubscribeOrig: CATALOGCANBUYZEROORIGEnum
    let catalogWidth, catalogLength, catalogHeight: String?
    let catalogMeasure, catalogType: String
    let catalogAvailable, catalogBundle: CATALOGAVAILABLEEnum
    let catalogPriceType: CatalogPriceType
    let catalogRecurSchemeLength: String?
    let catalogRecurSchemeType: CATALOGCANBUYZEROORIGEnum
    let catalogTrialPriceID: JSONNull?
    let catalogWithoutOrder, catalogSelectBestPrice, catalogNegativeAmountTrace: CATALOGAVAILABLEEnum
    let catalogNegativeAmountTraceOrig: CATALOGCANBUYZEROORIGEnum
    let catalogVat: String
    let extendedPrice: [ExtendedPrice]
    let morePhoto: MorePhoto?
    let coutcomments: String
    let propertyZalogValue: Int
    let favorite: Bool
    let kofficient: Int
    let nalichie: Nalichie?
    let edinicaizmereniya: JSONNull?
    let newPrice: NewPrice?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case iblockID = "IBLOCK_ID"
        case name = "NAME"
        case dateActiveFrom = "DATE_ACTIVE_FROM"
        case detailPicture = "DETAIL_PICTURE"
        case propertyNewproductValue = "PROPERTY_NEWPRODUCT_VALUE"
        case propertyNewproductEnumID = "PROPERTY_NEWPRODUCT_ENUM_ID"
        case propertyNewproductValueID = "PROPERTY_NEWPRODUCT_VALUE_ID"
        case propertyPodarokValue = "PROPERTY_PODAROK_VALUE"
        case propertyPodarokEnumID = "PROPERTY_PODAROK_ENUM_ID"
        case propertyPodarokValueID = "PROPERTY_PODAROK_VALUE_ID"
        case propertySaleleaderValue = "PROPERTY_SALELEADER_VALUE"
        case propertySaleleaderEnumID = "PROPERTY_SALELEADER_ENUM_ID"
        case propertySaleleaderValueID = "PROPERTY_SALELEADER_VALUE_ID"
        case propertyTsenaZaEdinitsuTovaraValue = "PROPERTY_TSENA_ZA_EDINITSU_TOVARA_VALUE"
        case propertyTsenaZaEdinitsuTovaraValueID = "PROPERTY_TSENA_ZA_EDINITSU_TOVARA_VALUE_ID"
        case propertyRatingValue = "PROPERTY_RATING_VALUE"
        case propertyRatingValueID = "PROPERTY_RATING_VALUE_ID"
        case catalogQuantity = "CATALOG_QUANTITY"
        case catalogQuantityTrace = "CATALOG_QUANTITY_TRACE"
        case catalogQuantityTraceOrig = "CATALOG_QUANTITY_TRACE_ORIG"
        case catalogWeight = "CATALOG_WEIGHT"
        case catalogVatID = "CATALOG_VAT_ID"
        case catalogVatIncluded = "CATALOG_VAT_INCLUDED"
        case catalogCanBuyZero = "CATALOG_CAN_BUY_ZERO"
        case catalogCanBuyZeroOrig = "CATALOG_CAN_BUY_ZERO_ORIG"
        case catalogPurchasingPrice = "CATALOG_PURCHASING_PRICE"
        case catalogPurchasingCurrency = "CATALOG_PURCHASING_CURRENCY"
        case catalogQuantityReserved = "CATALOG_QUANTITY_RESERVED"
        case catalogSubscribe = "CATALOG_SUBSCRIBE"
        case catalogSubscribeOrig = "CATALOG_SUBSCRIBE_ORIG"
        case catalogWidth = "CATALOG_WIDTH"
        case catalogLength = "CATALOG_LENGTH"
        case catalogHeight = "CATALOG_HEIGHT"
        case catalogMeasure = "CATALOG_MEASURE"
        case catalogType = "CATALOG_TYPE"
        case catalogAvailable = "CATALOG_AVAILABLE"
        case catalogBundle = "CATALOG_BUNDLE"
        case catalogPriceType = "CATALOG_PRICE_TYPE"
        case catalogRecurSchemeLength = "CATALOG_RECUR_SCHEME_LENGTH"
        case catalogRecurSchemeType = "CATALOG_RECUR_SCHEME_TYPE"
        case catalogTrialPriceID = "CATALOG_TRIAL_PRICE_ID"
        case catalogWithoutOrder = "CATALOG_WITHOUT_ORDER"
        case catalogSelectBestPrice = "CATALOG_SELECT_BEST_PRICE"
        case catalogNegativeAmountTrace = "CATALOG_NEGATIVE_AMOUNT_TRACE"
        case catalogNegativeAmountTraceOrig = "CATALOG_NEGATIVE_AMOUNT_TRACE_ORIG"
        case catalogVat = "CATALOG_VAT"
        case extendedPrice = "EXTENDED_PRICE"
        case morePhoto = "MORE_PHOTO"
        case coutcomments = "COUTCOMMENTS"
        case propertyZalogValue = "PROPERTY_ZALOG_VALUE"
        case favorite = "FAVORITE"
        case kofficient = "KOFFICIENT"
        case nalichie = "NALICHIE"
        case edinicaizmereniya = "EDINICAIZMERENIYA"
        case newPrice = "NewPrice"
    }
}

enum CATALOGAVAILABLEEnum: String, Codable {
    case n = "N"
    case y = "Y"
}

enum CATALOGCANBUYZEROORIGEnum: String, Codable {
    case d = "D"
}

enum CatalogPriceType: String, Codable {
    case s = "S"
}

struct ExtendedPrice: Codable {
    let price, oldPrice, quantityFrom, quantityTo: Int

    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
        case oldPrice = "OLD_PRICE"
        case quantityFrom = "QUANTITY_FROM"
        case quantityTo = "QUANTITY_TO"
    }
}

struct MorePhoto: Codable {
    let value: [String]

    enum CodingKeys: String, CodingKey {
        case value = "VALUE"
    }
}

struct Nalichie: Codable {
    let name, cvet, x, y: String
    let z: String

    enum CodingKeys: String, CodingKey {
        case name = "NAME"
        case cvet = "CVET"
        case x = "X"
        case y = "Y"
        case z = "Z"
    }
}

struct NewPrice: Codable {
    let price, descPrice: String

    enum CodingKeys: String, CodingKey {
        case price = "Price"
        case descPrice = "DescPrice"
    }
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

final class CategoriesViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    private var selectedCategoryIndex = 0
    private let categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let productsViewController = ProductsViewController()
    private let viewModel: CategoriesViewModel = CategoriesViewModelImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.loadData()
        setupUI()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
           
            return createCategories()
           
        }, configuration: configuration)
    }
    
    private func createCategories() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .absolute(30)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 20
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .absolute(35)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
                
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 10
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.interGroupSpacing = 10
        
        return section
    }
    
    private func setupUI() {
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        view.addSubview(categoriesCollectionView)
        
        addChild(productsViewController)
        view.addSubview(productsViewController.view)
        productsViewController.didMove(toParent: self)
        productsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            productsViewController.view.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
            productsViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsViewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.alwaysBounceVertical = false
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        
        categoriesCollectionView.collectionViewLayout = createLayout()
    }
        
    private func updateProductsViewController() {
        guard !viewModel.categories.isEmpty else { return }
        let selectedCategory = viewModel.categories[selectedCategoryIndex]
        
        UIView.transition(with: productsViewController.view,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: {
            self.productsViewController.updateProducts(for: selectedCategory)
        })
    }
    
    private func selectFirstCategory() {
        guard !viewModel.categories.isEmpty else { return }
        selectedCategoryIndex = 0
        let indexPath = IndexPath(item: selectedCategoryIndex, section: 0)
        categoriesCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        updateProductsViewController()
    }
    
    private func scrollToInitialPosition() {
        productsViewController.productsCollectionView.setContentOffset(.zero, animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension CategoriesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell,
              let category = viewModel.categories[safe: indexPath.item] else {
            return UICollectionViewCell()
        }
        cell.configure(with: category, isSelected: true)
        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension CategoriesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategoryIndex = indexPath.item
        updateProductsViewController()
        
        scrollToInitialPosition()
    }
}

// MARK: - CategoriesViewModelDelegate

extension CategoriesViewController: CategoriesViewModelDelegate {
    
    func hideSections() {
        categoriesCollectionView.isHidden = true
        productsViewController.view.isHidden = true
    }
    
    
    func updateProducts() {
        updateProductsViewController()
    }
    
    func reloadData() {
        categoriesCollectionView.reloadData()
        selectFirstCategory()
    }
}
