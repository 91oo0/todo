import UIKit

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    
    let presenter = CreateTaskPresenter()

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        
        setupKeyToolBar()
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        presenter.saveTask(title: titleTextField.text ?? "", lastDate: "2021/06/18")
        self.dismiss(animated: true)
    }
    
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension CreateTaskViewController {
    func setupKeyToolBar() {
        
        let keyToolbar = UIToolbar()
        keyToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        keyToolbar.barStyle = .default

        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(closeKeyboard))

        keyToolbar.items = [spacer, doneButton]

        titleTextField.inputAccessoryView = keyToolbar
    }

    @objc func closeKeyboard() {
        titleTextField.endEditing(true)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        guard let presentationController = presentationController else { return }
        presentationController.delegate?.presentationControllerWillDismiss?(presentationController)
    }
}
