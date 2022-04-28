//
//  MovieCellTableViewCell.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 16/03/2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterMovie: CustomImageView!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        let bottomSpace: CGFloat = 5.0
        let bgColorView = UIView()
        let leftSpace: CGFloat = 7.0
        let rightSpace: CGFloat = 7.0
        let topSpace: CGFloat = 10.0
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: topSpace, left: leftSpace, bottom: 0, right: rightSpace))
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.backgroundColor = .black
        self.contentView.layer.backgroundColor = UIColor(red: 20, green: 20, blue: 20, alpha: 1).cgColor
        
        self.selectedBackgroundView = bgColorView
    }
}
