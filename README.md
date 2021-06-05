# ClientStorageSolution

## Configuration

0. .NET5.0 required.

1. Execute SQL script (at `ClientStorage.SQL`) against your desired SQL instance node. Edit `appsettings.json` related connection-string as required.

2. Run the app
**If app is deployed through IIS, and Log4Net default log file can't be created by the app at `C:\inetpub\wwwroot\...` and paths of the like, check `IIS_USRS` user permissions at that path.