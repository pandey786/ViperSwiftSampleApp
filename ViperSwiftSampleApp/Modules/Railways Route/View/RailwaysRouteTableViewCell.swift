//
//  RailwaysRouteTableViewCell.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class RailwaysRouteTableViewCell: UITableViewCell {

    @IBOutlet weak var labelStationName: UILabel!
    @IBOutlet weak var lableStationCode: UILabel!
    @IBOutlet weak var lableDay: UILabel!
    @IBOutlet weak var labelScheduledArrival: UILabel!
    @IBOutlet weak var labelScheduleDeparture: UILabel!
    
    @IBOutlet weak var constraintTopConnectorHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintBottomConnectorHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(_ routeModel: TrainRouteModel) {
      
        if let stationModel = routeModel.station {
            labelStationName.text = stationModel.name
            lableStationCode.text = stationModel.code
        }
        
        self.labelScheduledArrival.text = routeModel.scharr
        self.labelScheduleDeparture.text = routeModel.schdep
        self.lableDay.text = "\(routeModel.distance!) Km"
    }
    
}


