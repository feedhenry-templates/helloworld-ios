# helloworld-ios-app 

> Swift version of HelloWorld app is available [here](https://github.com/feedhenry-templates/helloworld-ios/tree/swift).

```helloworld-ios-app``` is a simple app to test your remote cloud connection. Its server side companion app: [HelloWorld Cloud App](https://github.com/feedhenry-templates/helloworld-cloud). This template app demos how to intialize a cloud call and make calls to cloud endpoints. The app uses [fh-ios-sdk](https://github.com/feedhenry/fh-ios-sdk). 

|                 | Project Info  |
| --------------- | ------------- |
| License:        | Apache License, Version 2.0  |
| Build:          | Embedded FH.framework  |
| Documentation:  | http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html|

### Build

1. Clone this project

2. Populate ```iOS-Template-App/fhconfig.plist``` with your values as explained [here](http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html#ios-configure).

3. open Helloworld-app-iOS.xcodeproj

## Example Usage

### Init

In ```iOS-Template-App/HomeViewController.m``` the FH.init call is done:
```
- (void)viewDidLoad {  
    // Initialized cloud connection
    [FH initWithSuccess:^(FHResponse *response) { // [1] 
        // Do you other calls to the cloud.       // [2]
    } AndFailure:^(FHResponse *response) {
        // Log an error                           // [3]
    }];
}

```
[1] Initialize the cloud connection.

[2] On successfull callback, you are ready to do other calls.

[3] Log an eror.

### Cloud call

In ```iOS-Template-App/HomeViewController.m``` the FH.init call is done:
```
- (IBAction)cloudCall:(id)sender {
    NSDictionary *args = [NSDictionary dictionaryWithObject:name.text forKey:@"hello"];
    FHCloudRequest *req = (FHCloudRequest *) [FH buildCloudRequest:@"/hello" WithMethod:@"POST" AndHeaders:nil AndArgs:args];      // [1]  
    [req execAsyncWithSuccess:^(FHResponse * res) {       // [2]
        // Response
    } AndFailure:^(FHResponse * res){
        // Errors
    }];
}
```
[1] Create a cloud request specifying endpoint and its arguments.

[2] Make asynchronous call with its success and error callbacks.
