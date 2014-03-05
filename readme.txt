wc2467
Wei Cao

=======================
Quick Info
=======================
As expected, this app I made can meet the homework requirement to plot the places on the map.The process is quite easy. First, launch the app and enter the “name”,”type” and “distance (radius)” of the place. Then press button “save” to save the information you just enter in each text box. The press “Search” to launch the map. When located to your current place (a blue will show your current location), then press the yellow toolbar button “Press this to show the result”. Finally,annotations will drop to show the results on the map. You can go back to text box page to start a new search by press “back”. It is a quite straightforward search engine.


=======================
File Highlights (most of the code is here)
=======================

1. VC1:homeviewcontroller, to handle the text the user just enter in the texts fields, then pass the data to the next viewcontroller (mapviewcontroller) by using the segue.
Code:
// Realize the segue and pass the data to the next viewcontroller.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"go"]) {
        MapViewController *receiver = segue.destinationViewController;
        receiver.queryname = self.query;
        receiver.type = self.type;
        receiver.radius = self.radius;
    }
}

2. VC2:Mapviewcontroller
I think show places’ locations on the map and make annotations are key part here:
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    
    //Zoom back to the user location after adding a new set of annotations.
    
    //Get the center point of the visible map.
    CLLocationCoordinate2D centre = [mv centerCoordinate];
    
    MKCoordinateRegion region;
    
    double distance = [self.radius doubleValue];

    if (firstLaunch) {
        region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,distance,distance);
        firstLaunch=NO;
    }else {
        //Set the center point to the visible region of the map and change the radius to the query distance
        region = MKCoordinateRegionMakeWithDistance(centre,currenDist,currenDist);
    }
    
    //Set the visible region of the map.
    [mv setRegion:region animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    //Define our reuse indentifier.
    static NSString *identifier = @"MapPoint";
    
    
    if ([annotation isKindOfClass:[MapPoint class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        
        
        return annotationView;
    }
    
    return nil;
}


3. I add a new class “”mappoint” to help show the annotations.

4. Images: Add an app icon. Add a background image to the homeviewcontroller. 

=======================
Known Bugs
=======================

One thing is that this app will need your location first. If you launch it in the simulator, you maybe need to set current location in the simulator manual, such as entering coordinates or Apple, etc. Except this, the app works quite well. No warning or bugs so far.

=======================
Lessons Learned
=======================

I try to use a table view to show the results but I think it will be more complicated. So I just plot the results directly on the map. It is my first iOS app design and I feel good about it. Maybe next time I will try some challenge features. 

