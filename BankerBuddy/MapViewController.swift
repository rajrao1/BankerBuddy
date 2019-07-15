//
//  MapViewController.swift
//  BankerBuddy
//
//  Created by Developer on 14/07/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class MapViewController: UIViewController {

    private let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        // Change the Map to focus on current location -- Need to check
        self.locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        
        // self.appLoadAlert();
    }
    
    func appLoadAlert () {
        
        let alert = UIAlertController(title: "Features enabled", message: "1. Current location 2. Address search 3. Loading of the map for the address searched 4. Location feature enablement", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    // Present the Autocomplete view controller when the user taps the search field.
    @IBAction func autocompleteClicked(_ sender: UIBarButtonItem) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        
        // Set a filter to return only addresses.
        let addressFilter = GMSAutocompleteFilter()
        addressFilter.type = .address
        autocompleteController.autocompleteFilter = addressFilter
        
        present(autocompleteController, animated: true, completion: nil)
    }
    
    
    // Screenshot of the current view
    @IBAction func captureClicked(_ sender: UIBarButtonItem) {
        // Hide the location
        isMapElementVisible(visibilityStatus: false)
        
        //Create the UIImage
        let renderer = UIGraphicsImageRenderer(size: view.frame.size)
        let image = renderer.image(actions: { context in
            view.layer.render(in: context.cgContext)
        })
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        // Enable Back the map elements
        isMapElementVisible(visibilityStatus: true)
    }

    func isMapElementVisible(visibilityStatus:Bool) {
        mapView.settings.myLocationButton = visibilityStatus
        mapView.settings.compassButton = visibilityStatus // Enable compass button
    }
    
    
//    @IBAction func captureClicked(_ sender: UIBarButtonItem) {
//        let alert = UIAlertController(title: "Capture is still Work In Progress", message: "You should be able to see the map image capture in next build", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
}

// MARK: - CLLocationManagerDelegate

// Location Delegate
extension MapViewController: CLLocationManagerDelegate {
    
    // Location Authorization enable / disable delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        // Return if user did not allow access to the location usage
        guard status == .authorizedWhenInUse else {
            return
        }
        // Enable map update based on location
        locationManager.startUpdatingLocation()
        
        // Enable the users location identifiation and Button to center map to the user location
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        // Set the map type, enable scrolling and zoom using gestures
        
        // Satellite maps with a transparent label overview. - kGMSTypeHybrid - 4
        mapView.mapType = GMSMapViewType(rawValue: 4)!
        mapView.settings.scrollGestures = true // Enable scroll gesture - default enabled
        mapView.settings.zoomGestures = true // Enable zoom gesture - default enabled
        mapView.settings.compassButton = true // Enable compass button
    }
    
    // Location changed
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        // Camera change to the changed location
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        // Stop the location update
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - GMSAutocompleteViewControllerDelegate
extension MapViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        /*
        // Print place info to the console.
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
 */
/*
        // Get the address components.
        if let addressLines = place.addressComponents {
            // Populate all of the address fields we can find.
            for field in addressLines {
                switch field.type {
                case kGMSPlaceTypeStreetNumber:
                    street_number = field.name
                case kGMSPlaceTypeRoute:
                    route = field.name
                case kGMSPlaceTypeNeighborhood:
                    neighborhood = field.name
                case kGMSPlaceTypeLocality:
                    locality = field.name
                case kGMSPlaceTypeAdministrativeAreaLevel1:
                    administrative_area_level_1 = field.name
                case kGMSPlaceTypeCountry:
                    country = field.name
                case kGMSPlaceTypePostalCode:
                    postal_code = field.name
                case kGMSPlaceTypePostalCodeSuffix:
                    postal_code_suffix = field.name
                // Print the items we aren't using.
                default:
                    print("Type: \(field.type), Name: \(field.name)")
                }
            }
        }

        // Call custom function to populate the address form.
        fillAddressForm()
*/
        
        // Update the camera to the selected address
        mapView.camera = GMSCameraPosition(target: place.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

        // Close the autocomplete widget.
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Show the network activity indicator.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    // Hide the network activity indicator.
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
