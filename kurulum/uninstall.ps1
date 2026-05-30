# Stronghold Crusader Extreme - Turkce Yama Kaldirma
# Orijinal dosyalari _TR_Yedek klasorunden geri yukler.
$ErrorActionPreference = "Stop"
chcp 65001 > $null
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Turkce Yama - KALDIRMA" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

function Find-Game {
    $roots = @()
    $steam = (Get-ItemProperty 'HKCU:\Software\Valve\Steam' -ErrorAction SilentlyContinue).SteamPath
    if (-not $steam) { $steam = (Get-ItemProperty 'HKLM:\SOFTWARE\WOW6432Node\Valve\Steam' -ErrorAction SilentlyContinue).InstallPath }
    if ($steam) {
        $roots += $steam
        $vdf = Join-Path $steam "steamapps\libraryfolders.vdf"
        if (Test-Path $vdf) {
            foreach ($line in Get-Content $vdf) {
                $m = [regex]::Match($line, '"path"\s+"(.+?)"')
                if ($m.Success) { $roots += ($m.Groups[1].Value -replace '\\\\','\') }
            }
        }
    }
    $roots += "C:\Program Files (x86)\Steam"
    foreach ($r in $roots) {
        $g = Join-Path $r "steamapps\common\Stronghold Crusader Extreme"
        if (Test-Path (Join-Path $g "cr.tex")) { return $g }
    }
    return $null
}

$game = Find-Game
if (-not $game) {
    $game = (Read-Host "Oyun klasorunu yapistirin").Trim('"')
}
$bk = Join-Path $game "_TR_Yedek"
if (-not (Test-Path $bk)) {
    Write-Host "Yedek klasoru (_TR_Yedek) bulunamadi." -ForegroundColor Red
    Write-Host "Orijinalleri Steam'de 'dosya butunlugunu dogrula' ile geri alabilirsiniz." -ForegroundColor Yellow
    Read-Host "Cikmak icin Enter'a basin"; exit 1
}

$files = @("cr.tex","gm\font_stronghold_aa.gm1","help\crusader_help.hlp","help\crusader_extreme_help.hlp")
foreach ($f in $files) {
    $save = Join-Path $bk $f
    $dest = Join-Path $game $f
    if (Test-Path $save) {
        Copy-Item $save $dest -Force
        Write-Host "  Geri yuklendi: $f"
    }
}
Write-Host ""
Write-Host "Yama kaldirildi, oyun yeniden Ingilizce." -ForegroundColor Green
Read-Host "Cikmak icin Enter'a basin"
