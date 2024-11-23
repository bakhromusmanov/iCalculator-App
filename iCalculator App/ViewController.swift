import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    //MARK: - IBOutlets Buttons
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var changeSign: UIButton!
    @IBOutlet weak var ac: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var decimal: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    //MARK: - Custom Variables
    private var currentNumber: String = "0"
    private var previousNumber: Double = 0
    private var operation: String? = nil
    private var isTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    // MARK: - Button IBActions
    
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        if isTyping {
            currentNumber += buttonTitle
        } else {
            currentNumber = buttonTitle
            isTyping = true
        }
        
        updateResultLabel()
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        if isTyping {
            previousNumber = Double(currentNumber) ?? 0
            isTyping = false
        }
        
        operation = buttonTitle
        currentNumber = "0"
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        guard let operation = operation else { return }
        
        let current = Double(currentNumber) ?? 0
        let result: Double
        
        switch operation {
        case "+":
            result = previousNumber + current
        case "-":
            result = previousNumber - current
        case "*":
            result = previousNumber * current
        case ":":
            result = current == 0 ? 0 : previousNumber / current
        default:
            return
        }
        
       currentNumber = String(format: "%.2f", result)
       previousNumber = result
        self.operation = nil
        isTyping = false
        
        updateResultLabel()
    }
    
    @IBAction func percentagePressed(_ sender: UIButton) {
        let number = Double(currentNumber) ?? 0
        currentNumber = String(number / 100)
        updateResultLabel()
    }
    
    @IBAction func changeSignPressed(_ sender: UIButton) {
        let number = Double(currentNumber) ?? 0
        currentNumber = String(-number)
        updateResultLabel()
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if !currentNumber.contains(".") {
            currentNumber += "."
        }
        updateResultLabel()
    }
    
    // MARK: - Helper Methods
    
    private func resetCalculator() {
        currentNumber = "0"
        previousNumber = 0
        operation = nil
        isTyping = false
        updateResultLabel()
    }
    
    private func updateResultLabel() {
        result.text = currentNumber
    }
}
