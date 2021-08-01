//
//  MapVC.swift
//  schoolApp
//
//  Created by mac on 27/07/2021.
//

import MapKit
import Contacts// use to open the maps app in iphone or ipad

class MapVC: UIViewController {

    
    @IBOutlet private var mapView: MKMapView!
    private var artworks: [Artwork] = []
    var schoolDataInMapVC:[SchoolData] = []
    var lat:Double = 0.0
    var long:Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// here the map will show the location of oahu location only you con't show any locations
        // you will abile to zoom in/ out only on this location
        // in the feauter you will get the coordinates from firebase when the user select the state
        //let oahuCenter = CLLocation(latitude: 21.282778, longitude: -157.829444) // <- here states coordinates
        let oahuCenter = CLLocation(latitude: lat, longitude: long)// <- KSA coordinates
        //mapView.centerToLocation(initialLocation)
        let region = MKCoordinateRegion(
              center: oahuCenter.coordinate,
              latitudinalMeters: 50000,// how match you can move to the left and right
              longitudinalMeters: 60000)// how match you can move to the top and down
            mapView.setCameraBoundary(
              MKMapView.CameraBoundary(coordinateRegion: region),
              animated: true)
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            mapView.setCameraZoomRange(zoomRange, animated: true)
      
        // here show a mark on the place
         mapView.delegate = self
        loadInitialData()
        //loadInitialData()
        //mapView.addAnnotations(artworks)
        
    }
   
    // read data from geojson file
//    private func loadInitialData() {
//      // 1- Read the data from Geojson file
//      guard
//        let fileName = Bundle.main.url(forResource: "ksaSchool", withExtension: "geojson"),
//        let artworkData = try? Data(contentsOf: fileName)
//        else {
//          return
//      }
//
//      do {
//        // 2
//        let features = try MKGeoJSONDecoder()
//          .decode(artworkData)
//          .compactMap { $0 as? MKGeoJSONFeature }
//        // 3
//        let validWorks = features.compactMap(Artwork.init)
//        // 4
//        artworks.append(contentsOf: validWorks)
//      } catch {
//        // 5
//        print("Unexpected error: \(error).")
//      }
//    }
    
    // test mode
    private func loadInitialData() {
        /// here you will 
        for school in schoolDataInMapVC{
            
            let title = school.school_name
            let locatoin = school.school_location
            let dis = school.school_type
            let coordinate = school.coordinate
            let artwork = Artwork(title: title, locationName: locatoin, discipline: dis, coordinate: coordinate)
            self.mapView.addAnnotation(artwork)
        }
    }

}
// هنا بقوله في ريجون الرتفاع الى هيظر بيه الخريطة و متغير اللوكيشين بيعبر عن منتصف الخريطة
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
extension MapVC: MKMapViewDelegate {
  // 1
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    // 2
    guard let annotation = annotation as? Artwork else {
      return nil
    }
    // 3
    let identifier = "artwork"
    var view: MKMarkerAnnotationView
    // 4
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      // 5
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
    
    // this function will open the maps app when the user tap on info button
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
      guard let artwork = view.annotation as? Artwork else {
        return
      }

      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
      ]
      artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
    
}

