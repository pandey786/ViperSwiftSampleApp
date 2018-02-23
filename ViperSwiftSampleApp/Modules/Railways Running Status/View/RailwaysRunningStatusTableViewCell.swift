//
//  RailwaysRunningStatusTableViewCell.swift
//  ViperSwiftSampleApp
//
//  Created by Durgesh Pandey on 30/11/17.
//  Copyright © 2017 Durgesh Pandey. All rights reserved.
//

import UIKit

class RailwaysRunningStatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelStationName: UILabel!
    @IBOutlet weak var lableStationCode: UILabel!
    @IBOutlet weak var lableDay: UILabel!
    @IBOutlet weak var labelScheduledArrival: UILabel!
    @IBOutlet weak var labelScheduleDeparture: UILabel!
    @IBOutlet weak var labelActualArrival: UILabel!
    @IBOutlet weak var labelActualDeparture: UILabel!
    
    @IBOutlet weak var constraintTopConnectorHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintBottomConnectorHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(_ routeModel: TrainRunningStatusRouteModel) {
        
        if let stationModel = routeModel.station {
            labelStationName.text = stationModel.name
            lableStationCode.text = stationModel.code
        }
        
        self.labelScheduledArrival.text = routeModel.scharr
        self.labelScheduleDeparture.text = routeModel.schdep
        self.labelActualArrival.text = routeModel.actarr
        self.labelActualDeparture.text = routeModel.actdep
        
        self.lableDay.text = "\(routeModel.distance!) Km"
        
    }
    
}


