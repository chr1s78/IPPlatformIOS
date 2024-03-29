import SwiftUI

struct NavigationSearchBarHosting: UIViewControllerRepresentable {
    
    var placeholder: String?
    @Binding var searchTerm: String
    var scopes: [String]?
    @Binding var selectedScope: Int
    var hidesWhenScrolling: Bool
    var showsScopeBar: Bool
    var onPresentationChange: ((Bool) -> Void)?
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.parent?.navigationItem.searchController = context.coordinator.searchController
        uiViewController.parent?.navigationItem.hidesSearchBarWhenScrolling = hidesWhenScrolling
        
        context.coordinator.searchController.searchBar.text = searchTerm
        context.coordinator.searchController.searchBar.scopeButtonTitles = scopes
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
        
        var parent: NavigationSearchBarHosting
        let searchController: UISearchController
        
        private var parentSearchTerm: String? {
            didSet {
                // 이전 값과 비교하여 불필요하게 Binding의 set 클로저가 호출되는 것을 막는다.
                guard parentSearchTerm != oldValue else {
                    return
                }
                parent.searchTerm = parentSearchTerm ?? ""
            }
        }
        
        init(_ navigationSearchBarHosting: NavigationSearchBarHosting) {
            self.parent = navigationSearchBarHosting
            self.searchController = UISearchController()
            super.init()
            setupSearchController()
        }
        
        private func setupSearchController() {
            searchController.delegate = self
            searchController.searchBar.delegate = self
            searchController.searchResultsUpdater = self
            
            searchController.obscuresBackgroundDuringPresentation = false
            
            if parent.placeholder != nil {
                searchController.searchBar.placeholder = parent.placeholder
            }
            
            // showsScopeBar가 false일 때는 덮어씌우지 않는다.
            if parent.showsScopeBar == true {
                // updateUIViewController()에서 showsScopeBar를 설정하면
                // showsScopeBar가 시스템에 의해 토글되어야 할 때도 값을 덮어씌우는 문제가 발생한다.
                // showsScopeBar는 어떤 modifier를 사용하는지에 따라 결정되기에 바인딩에 의해 변경될 일이 없으므로
                // Coordinator 초기화 시 한 번만 설정해도 괜찮다.
                searchController.searchBar.showsScopeBar = true
            }
        }
        
        // UISearchControllerDelegate
        func didPresentSearchController(_ searchController: UISearchController) {
            parent.onPresentationChange?(true)
        }
        
        func didDismissSearchController(_ searchController: UISearchController) {
            parent.onPresentationChange?(false)
        }
        
        // UISearchResultsUpdating
        func updateSearchResults(for searchController: UISearchController) {
            parentSearchTerm = searchController.searchBar.text
        }
        
        // UISearchBarDelegate
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            parent.selectedScope = selectedScope
        }
    }
}

struct NavigationSearchBarModifier: ViewModifier {
    
    var placeholder: String?
    @Binding var searchTerm: String
    var scopes: [String]?
    @Binding var selectedScope: Int
    var hidesWhenScrolling: Bool
    var showsScopeBar: Bool
    var onPresentationChange: ((Bool) -> Void)?
    
    func body(content: Content) -> some View {
        content.background(
            NavigationSearchBarHosting(
                placeholder: placeholder,
                searchTerm: $searchTerm,
                scopes: scopes,
                selectedScope: $selectedScope,
                hidesWhenScrolling: hidesWhenScrolling,
                showsScopeBar: showsScopeBar,
                onPresentationChange: onPresentationChange
            )
        )
    }
}

public extension View {
    
    func navigationSearchBar(
        placeholder: String? = nil,
        searchTerm: Binding<String>,
        hidesWhenScrolling: Bool = true,
        onPresentationChange: @escaping (Bool) -> Void = { _ in }
    ) -> some View {
        self.modifier(
            NavigationSearchBarModifier(
                placeholder: placeholder,
                searchTerm: searchTerm,
                scopes: nil,
                selectedScope: .constant(0),
                hidesWhenScrolling: hidesWhenScrolling,
                showsScopeBar: false,
                onPresentationChange: onPresentationChange
            )
        )
    }
    
    func navigationSearchBar(
        placeholder: String? = nil,
        searchTerm: Binding<String>,
        searchScopes: [String]?,
        selectedSearchScope: Binding<Int>,
        hidesWhenScrolling: Bool = true,
        onPresentationChange: @escaping (Bool) -> Void = { _ in }
    ) -> some View {
        self.modifier(
            NavigationSearchBarModifier(
                placeholder: placeholder,
                searchTerm: searchTerm,
                scopes: searchScopes,
                selectedScope: selectedSearchScope,
                hidesWhenScrolling: hidesWhenScrolling,
                showsScopeBar: false,
                onPresentationChange: onPresentationChange
            )
        )
    }
}
