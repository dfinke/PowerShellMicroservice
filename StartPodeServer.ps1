Start-PodeServer {

    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http

    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {     
        #Write-PodeTextResponse -Value 'hello world' 
        Write-PodeTextResponse -Value 'hello world, from PowerShell in Docker' 
    }

    # echo it
    Add-PodeRoute -Method Get -Path '/echo/:stuff' -ScriptBlock {
        param($e)
    
        Write-PodeTextResponse -Value "[$(Get-Date)] echo: $($e.Parameters['stuff'])"
    }
}