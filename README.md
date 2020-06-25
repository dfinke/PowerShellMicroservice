## How to

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

- Edit `StartPdeServer.ps1`
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