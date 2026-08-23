#requires -version 5.1
<#
.SYNOPSIS
  Instala las skills de este pack (*.skill) en un proyecto de Claude Code.

.DESCRIPTION
  Copia cada archivo *.skill de este repo (son paquetes .zip con un SKILL.md
  dentro) a la carpeta .claude\skills del proyecto destino, o a
  ~\.claude\skills si se usa -Global.

.PARAMETER Path
  Carpeta del proyecto destino. Por defecto, el directorio actual.

.PARAMETER Global
  Instala en ~\.claude\skills en vez de en un proyecto concreto, para que
  las skills queden disponibles en todos tus proyectos.

.EXAMPLE
  .\install.ps1
  Instala en .\.claude\skills del directorio actual.

.EXAMPLE
  .\install.ps1 C:\proyectos\mi-otro-proyecto
  Instala en ese proyecto.

.EXAMPLE
  .\install.ps1 -Global
  Instala para todos tus proyectos.
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Path = ".",

    [switch]$Global
)

$ErrorActionPreference = "Stop"

$SourceDir = $PSScriptRoot
$SkillFiles = Get-ChildItem -Path $SourceDir -Filter "*.skill" -File

if (-not $SkillFiles) {
    Write-Error "No se encontraron archivos .skill en $SourceDir"
    exit 1
}

if ($Global) {
    $Dest = Join-Path $HOME ".claude\skills"
} else {
    $ResolvedPath = Resolve-Path -Path $Path
    $Dest = Join-Path $ResolvedPath ".claude\skills"
}

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

Add-Type -AssemblyName System.IO.Compression.FileSystem

$installed = @()
foreach ($skill in $SkillFiles) {
    $name = [System.IO.Path]::GetFileNameWithoutExtension($skill.Name)
    $skillDest = Join-Path $Dest $name

    if (Test-Path $skillDest) {
        Remove-Item -Recurse -Force $skillDest
    }

    # ExtractToDirectory exige extensión .zip, así que copiamos a un temporal.
    $tmpZip = [System.IO.Path]::GetTempFileName() + ".zip"
    Copy-Item $skill.FullName $tmpZip
    try {
        [System.IO.Compression.ZipFile]::ExtractToDirectory($tmpZip, $Dest)
    } finally {
        Remove-Item -Force $tmpZip
    }

    Write-Host "  + $name" -ForegroundColor Green
    $installed += $name
}

Write-Host ""
Write-Host "Instaladas $($installed.Count) skills en: $Dest" -ForegroundColor Cyan
