[CmdletBinding()]
Param(
    [Parameter(Mandatory = $False, HelpMessage = "Minimum profit in roubles you want to show")]
    $minprofit = 500,
    [Parameter(Mandatory = $False, HelpMessage = "Max amount of time in minutes an item was scanned. Items on the flea don't usually last more than 5 minutes")]
    $mintime = 15
)

$col = @()
$items = (Invoke-WebRequest -Headers @{ "x-api-key" = "oeLxJNwYfdgRL4be" } https://tarkov-market.com/api/v1/items/all).content | ConvertFrom-Json

foreach ($item in $items) {
    if ( [string]::IsNullOrEmpty($item.traderName) -or [string]::IsNullOrEmpty($item.traderPrice) -or $item.price -eq 0 ) { continue }
    $ts = (New-TimeSpan -End (get-date).ToUniversalTime() -Start $item.updated).TotalMinutes
    $ts
    $profit = $item.traderprice - $item.price
    if ( $profit -gt $minprofit -and $ts -lt $mintime ) { 
        $item | Add-Member -type NoteProperty -Name "potentialProfit" -value $profit
        $col += $item 
    }
}

$col | Sort-Object -Descending potentialProfit | Select-Object @{N = 'Name'; E = { $_.name } },
@{N = 'Flea Market Price'; E = { $_.price } },
@{N = 'Trader Sell Price'; E = { $_.traderprice } },
tradername,
@{N = 'Potential profit'; E = { $_.potentialProfit } },
@{N = 'Last Scanned'; E = { "$([math]::Round(((get-date).ToUniversalTime() - $_.updated).TotalMinutes))m ago" } } | Out-GridView