# DummyWebApp
#### A Web Application Test Server written in Xojo
 
![Main Page](https://raw.githubusercontent.com/gregorplop/DummyWebApp/main/images/DummyWebApp.PNG)

### You can use DummyWebApp for testing:

+ IT infrastructure / Connection links
+ Reverse Proxies
+ Load Balancers
+ SSL Offloaders
+ Server Orchestration tools

### Command-line parameters for the server executable:

| Command Line Argument   | Description |
|-------------------------|-------------|
| --port  | The port the web app listens to for a connection. This can be used to change the port that was used to build the web app. |
| --MaxSockets | The maximum number of allowed connected sockets. The default is 200. This is not the number of maximum users as the number of connections does not map one-to-one with the number of connected users. Do not set the value too high as it will increase memory and CPU usage. |
| --MinSockets | The minimum number of allowed connected sockets. The default is 20. |
| --SecurePort | The port the web app listens to for a secure connection. This can be used to change the port that was used to build the web app. |
| --SslType | Allows you to specify the type of security used. You can use these integer values: 3 (TLSv1), 4 (TLSv11), 5 (TLSv12, the default) |
| --MaxSecureSockets | The maximum number of allowed secure connected sockets. This is not the number of maximum users as the number of connections does not map one-to-one with the number of connected users. Do not set the value too high as it will increase memory and CPU usage. |
| --NetworkInterfaceIndex | The index value (of NetworkInterfaces) to use as the NIC for connections. Also accept the value "Loopback" to allow listening only on the loopback interface. |
| --SecureNetworkInterfaceIndex | The index value (of NetworkInterfaces) to use as the NIC for secure connections. Also accept the value "Loopback" to allow listening only on the loopback interface. |
| --Certificate | The path to the combined SSL key/certificate file. As described [here.](https://documentation.xojo.com/topics/web/ssl_for_web_apps.html) |
| --Logging | The path to HTTP Log file. |
| --UploadPath | Changes the default path used to save files that are uploaded or other large requests. |
| --urllength | Allows you to change the maximum number of characters allowed in a URL from 256 (the default) to a maximum of 2048. |

#### Example
+ DummyWebApp --port=8000 --sslport=9000 --Certificate=c:\temp\cert.crt

### Implemented functionality
+ A session-based Web interface (Xojo Web Framework 2)
+ Ability to kill the server from the Web interface
+ Monitor server instance state
+ API endpoint to get state in JSON
+ API endpoint to download the server executable
+ 
