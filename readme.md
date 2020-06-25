##Howto

If you've just opened CMD for the first time, run this:

```winbatch
powershell -noex -exec bypass -c "Invoke-WebRequest 'https://raw.githubusercontent.com/Cringely/Powershell/master/Get-EFTMarketDeals.ps1' | Invoke-Expression ; Get-EFTMarketDeals"
```
 As long as you haven't closed the CMD window, you can check for new results using:
 
 ```powershell
 Get-EFTMarketDeals
 ```
