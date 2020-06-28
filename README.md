# PowerShell Microservice

A PowerShell REST API running as a microservice in a Docker container.

Plus, use PowerShell's `Invoke-Build` as continuous build to stop the container, rebuild the image, and then run the new container. Ready for testing.

## Direct from GitHub

Build and run Docker the container straight from the repo.

```powershell
docker build --tag powershellmicroservice https://github.com/dfinke/PowerShellMicroservice.git
docker run -d --name powershellmicroservice -p 8080:8080 powershellmicroservice

sleep 2 # give the container a chance to spin up

Invoke-RestMethod http://localhost:8080/ # Hello from PowerShell in Docker
```

## How to Build and Run Locally

```powershell
Install-Module InvokeBuild

Invoke-Build
```

## Try it

```powershell
Invoke-RestMethod http://localhost:8080/
```

### Prints

```
hello world
```

## Echo endpoint

```powershell
Invoke-RestMethod http://localhost:8080/echo/YourData
```

### Prints

```
[06/25/2020 21:13:58] echo: YourData
```

## Update the PowerShell Script

- Edit `StartPodeServer.ps1`
- Comment out `Write-PodeTextResponse -Value 'hello world'`
- *Uncomment* `Write-PodeTextResponse -Value 'hello world, from PowerShell in Docker'`
- Save the file

Run 
```powershell
Invoke-Build
```

Try it:
```powershell
Invoke-RestMethod http://localhost:8080/
```

### Prints
```
hello world, from PowerShell in Docker
```
