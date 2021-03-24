import Charts
 
class ChartVC: UIViewController {
    @IBOutlet weak var linechart: LineChartView!
    @IBOutlet weak var piecht: PieChartView!
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 16.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLineGraph()
        setPieCht()
    }
    
    func setLineGraph(){
        var entry = [ChartDataEntry]()
        
        for (i,d) in unitsSold.enumerated(){
            entry.append(ChartDataEntry(x: Double(i),y: d))
        }
        
        let dataset = LineChartDataSet(entries: entry,label: "Units Sold")
                
        linechart.data = LineChartData(dataSet: dataset)
        linechart.chartDescription?.text = "Item Sold Chart"
    }
    
    func setPieCht(){
        
        var dataEntries: [ChartDataEntry] = []
 
        for i in 0..<months.count {
            dataEntries.append( PieChartDataEntry(value: unitsSold[i], label: months[i], data: unitsSold[i]))
        }
 
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")
 
        piecht.data = PieChartData(dataSet: pieChartDataSet)
 
        var colors: [UIColor] = []
 
        for _ in 0..<months.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
 
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
 
        pieChartDataSet.colors = colors
    }
}
