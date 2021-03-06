## Howto

If you've just opened CMD for the first time, run this:

```winbatch
powershell -noex -exec bypass -c "https://raw.githubusercontent.com/Cringely/Powershell/master/Get-EFTMarketDeals/Get-EFTMarketDeals.ps1' | Invoke-Expression ; Get-EFTMarketDeals"
```
 As long as you haven't closed the CMD window, you can check for new results using:
 
 ```powershell
 Get-EFTMarketDeals
 ```

Change the minimum profit margin using the `-minprofit #` parameter like this:
 ```powershell
 Get-EFTMarketDeals -minprofit 100
 Get-EFTMarketDeals -minprofit 24724
 #This amount is always profit in roubles
 ```
 
 Change the max amount of time in **minutes** an item was scanned using the `-mintime #` parameter. (Items on the flea don't usually last more than 5 minutes)
 
 example:
  ```powershell
 Get-EFTMarketDeals -mintime 30
 Get-EFTMarketDeals -mintime 180 -minprofit 24724
 ```

Change the output from a table to a popup sortable window with the `-ogv` parameter:
  ```powershell
 Get-EFTMarketDeals -mintime 5 -minprofit 1000 -ogv
 Get-EFTMarketDeals -ogv
 ```
