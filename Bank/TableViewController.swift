import UIKit

class TableViewController: UITableViewController {
    var items = UtilityBill.createItems()

    @IBOutlet var barButtonItem: UIBarButtonItem!
    
    let c1 = UIColor(red: 234/255, green: 221/255, blue: 195/255, alpha: 1).cgColor
    let c2 = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1).cgColor
    let c3 = UIColor(red: 125/255, green: 168/255, blue: 212/255, alpha: 1).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let image = UIImage(named: "Image 37.jpg")
        barButtonItem.image = image
        
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = imageView.frame.width * 0.5
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.opaqueSeparator.cgColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: imageView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [c1,c2,c3]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)

        tableView.backgroundView = backgroundView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorStyle = .none
        return items.count
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        cell.configureCell(items[indexPath.row])
        let item = items[indexPath.row]
        
        let currency = "BGN "
        let value = numberFormatter.string(from: NSNumber(value: item.value))!
        let valueText = currency + value
        let amountText = NSMutableAttributedString.init(string: valueText)
        let currencyCount = currency.count
        let len = value.lazy.prefix { $0 != "." }.count
        let bigDigitsRange = NSMakeRange(currencyCount, len)
        amountText.setAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23)],
                                     range: bigDigitsRange)
        cell.valueLabel.attributedText = amountText
        
        return cell
    }
}
