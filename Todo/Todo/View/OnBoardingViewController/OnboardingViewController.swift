import UIKit

class OnboardingViewController: UIViewController {
    
    var index = 0
    
    var lastPageIndex = 2
    
    var offset = CGPoint(x: 0, y: 0)
    
    let pageWidth = UIScreen.main.bounds.size.width
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
    }
        
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        if index != lastPageIndex {
            offset.x += pageWidth
            scrollView.setContentOffset(offset, animated: true)
            index += 1
            updateNextButtonText()
        } else {
            navigateToHome()
        }
    }
    
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        navigateToHome()
    }
    
    func updateNextButtonText() {
        if index == lastPageIndex {
            nextButton.setTitle("アプリを始める", for: .normal)
        } else {
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    
    func navigateToHome() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Root", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Root") as! RootViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: false)
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let calc = targetContentOffset.pointee.x / pageWidth
            index = Int(calc)
            offset.x = targetContentOffset.pointee.x
            updateNextButtonText()
    }
}
