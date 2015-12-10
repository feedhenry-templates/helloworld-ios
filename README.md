# helloworld-ios-app 

> Objectice-c version of HelloWorld app is available in [master branch](https://github.com/feedhenry-templates/helloworld-ios).

```helloworld-ios-app``` is a simple app to test your remote cloud connection. Its server side companion app: [HelloWorld Cloud App](https://github.com/feedhenry-templates/helloworld-cloud). This template app demos how to intialize a cloud call and make calls to cloud endpoints. The app uses [fh-ios-sdk](https://github.com/feedhenry/fh-ios-sdk). 

100% Swift app.

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

In ```iOS-Template-App/HomeViewController.swift``` the FH.init call is done:
```
- (void)viewDidLoad {  
    override func viewDidLoad() {
        // Initialized cloud connection
        let successCallback:(AnyObject!) -> Void = {response in // [2]
            print("initialized OK")
            self.button.hidden = false
        }
        let errorCallback: (AnyObject!) -> Void = {response in  // [3]
            if let response = response as? FHResponse {
                print("FH init failed. Error = \(response.rawResponseAsString)")
                self.result.text = "Please fill in fhconfig.plist file."
            }
        }
        FH.initWithSuccess(successCallback, andFailure: errorCallback)  // [1]
    }
}

```
[1] Initialize the cloud connection.

[2] On successfull callback, you are ready to do other calls.

[3] Log an eror.

### Cloud call

In ```iOS-Template-App/HomeViewController.m``` the FH.init call is done:
```
@IBAction func cloudCall(sender: AnyObject) {
    let args = ["hello": name.text ?? "world"]    // [1]
    let successCallback:(AnyObject!) -> Void = {response in
         if let response = response as? FHResponse {
            if let parsedRes = response.parsedResponse as? [String:String] {
                self.result.text = parsedRes["msg"]
            }
        }
    }
    let errorCallback: (AnyObject!) -> Void = {response in
        if let response = response as? FHResponse {
            print("initialize fail, \(response.rawResponseAsString)")
            self.button.hidden = true
        }
    }
    FH.performCloudRequest("hello", withMethod: "POST", 
       andHeaders: nil, andArgs: args, andSuccess: successCallback, andFailure: errorCallback)  // [2]
    }
```
[1] Create a dictionary of arguments.

[2] Make asynchronous call with its success and error callbacks.

### iOS9 and non TLS1.2 backend

If your RHMAP is depoyed without TLS1.2 support, open as source  ```blank-ios-app/blank-ios-app-Info.plist.plist``` uncomment the exception lines:

```
  <!--
  <key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
  </dict>
   -->
```

