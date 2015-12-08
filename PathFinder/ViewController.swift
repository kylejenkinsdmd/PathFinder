//
//  ViewController.swift
//  PathFinder
//
//  Created by Kyle Jenkins on 24/11/2015.
//  Copyright © 2015 Kyle Jenkins. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

	@IBOutlet weak var Map: MKMapView!
	@IBOutlet weak var cacheRegion: UILabel!
	
	let locationManager = CLLocationManager()
	
	let namePlace: String = "Town Square, Balloon, Lower Gardens, Pavilion, Aquarium & Hot Rocks, Pier, View of Beach, Journey Home"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let myLocation = CLLocationCoordinate2D(latitude: 50.720139 , longitude: -1.879898)
		let myRegion = CLCircularRegion(center: myLocation, radius: 100, identifier: "BournemouthCache")
		
		locationManager.requestAlwaysAuthorization()
		locationManager.delegate = self
		locationManager.startUpdatingLocation()
		locationManager.startMonitoringForRegion(myRegion)
		
	      Map.delegate = self
		Map.mapType = MKMapType.Satellite
		Map.showsUserLocation = true
		
		Map.setUserTrackingMode(.Follow, animated: true)
		
		
		
	}




}
extension ViewController:  CLLocationManagerDelegate {
	
	func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
		cacheRegion.text = "\(namePlace)"
	}
}