import UIKit

class TableCell: UITableViewCell {

    @IBOutlet var viewInsideCell: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!

    func configureCell(_ item: Item) {
        viewInsideCell.layer.cornerRadius = 15
        nameLabel?.text = item.name
        valueLabel?.text = "\(item.value)"
        dateLabel?.text = item.date
        thumbnailImageView?.image = UIImage(named: item.image)
        backgroundColor = .clear
    }
}
