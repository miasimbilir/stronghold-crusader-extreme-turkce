# Stronghold Crusader Extreme - Turkce Yama Kurulumu
# Bu betik oyunu otomatik bulur, orijinal dosyalari yedekler ve Turkce yamayi kurar.
$ErrorActionPreference = "Stop"
chcp 65001 > $null
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Stronghold Crusader Extreme - TURKCE YAMA" -ForegroundColor Cyan
Write-Host "  Kurulum" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Yama dosyalarinin bulundugu klasor (bu betigin bir ust klasoru\dosyalar)
$root  = Split-Path -Parent $PSScriptRoot
$src   = Join-Path $root "dosyalar"
if (-not (Test-Path (Join-Path $src "cr.tex"))) {
    Write-Host "HATA: Yama dosyalari bulunamadi ($src)." -ForegroundColor Red
    Write-Host "Lutfen ZIP'i tamamen cikartip Kur.bat'i oradan calistirin." -ForegroundColor Red
    Read-Host "Cikmak icin Enter'a basin"; exit 1
}

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
    Write-Host "Oyun otomatik bulunamadi." -ForegroundColor Yellow
    Write-Host "Lutfen oyunun kurulu oldugu klasoru yapistirin."
    Write-Host "(Ornek: D:\SteamLibrary\steamapps\common\Stronghold Crusader Extreme)"
    $game = (Read-Host "Klasor yolu").Trim('"')
    if (-not (Test-Path (Join-Path $game "cr.tex"))) {
        Write-Host "HATA: Bu klasorde cr.tex bulunamadi. Yanlis klasor." -ForegroundColor Red
        Read-Host "Cikmak icin Enter'a basin"; exit 1
    }
}
Write-Host "Oyun bulundu:" -ForegroundColor Green
Write-Host "  $game"
Write-Host ""

# Yamalanacak dosyalar (kaynak -> oyun icindeki goreli yol)
$files = @(
    @{ s = "cr.tex";                              d = "cr.tex" },
    @{ s = "gm\font_stronghold_aa.gm1";           d = "gm\font_stronghold_aa.gm1" },
    @{ s = "help\crusader_help.hlp";              d = "help\crusader_help.hlp" },
    @{ s = "help\crusader_extreme_help.hlp";      d = "help\crusader_extreme_help.hlp" }
)

# Orijinalleri yedekle (sadece ilk kurulumda; mevcut yedegin uzerine YAZMA)
$bk = Join-Path $game "_TR_Yedek"
New-Item -ItemType Directory -Force -Path $bk | Out-Null
foreach ($f in $files) {
    $orig = Join-Path $game $f.d
    $save = Join-Path $bk   $f.s
    New-Item -ItemType Directory -Force -Path (Split-Path $save) | Out-Null
    if ((Test-Path $orig) -and -not (Test-Path $save)) {
        Copy-Item $orig $save -Force
    }
}
Write-Host "Orijinal dosyalar yedeklendi: _TR_Yedek\" -ForegroundColor Green

# Yamayi kur
foreach ($f in $files) {
    Copy-Item (Join-Path $src $f.s) (Join-Path $game $f.d) -Force
    Write-Host "  Kuruldu: $($f.d)"
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Green
Write-Host "  KURULUM TAMAMLANDI! Iyi oyunlar." -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Not: Steam'de 'Oyun dosyalarinin butunlugunu dogrula'" -ForegroundColor Yellow
Write-Host "calistirirsaniz yama silinir; tekrar Kur.bat calistirin." -ForegroundColor Yellow
Write-Host "Yamayi kaldirmak icin Kaldir.bat dosyasini calistirin." -ForegroundColor Yellow
Write-Host ""
Read-Host "Cikmak icin Enter'a basin"
