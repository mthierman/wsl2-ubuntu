function Prompt
{
    "$($ExecutionContext.SessionState.Path.CurrentLocation)$('>' * ($NestedPromptLevel + 1)) "
}

Set-Alias -Name t -Value task
Set-Alias -Name mc -Value Measure-Command
Set-Alias -Name e -Value explorer
Set-Alias -Name g -Value git
Set-Alias -Name c -Value cargo
Set-Alias -Name d -Value deno
Set-Alias -Name n -Value npm
Set-Alias -Name p -Value pnpm

$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.Cyan
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.Cyan
$PSStyle.Formatting.ErrorAccent = $PSStyle.Foreground.Red
$PSStyle.Formatting.Error = $PSStyle.Foreground.Red
$PSStyle.Formatting.Warning = $PSStyle.Foreground.Yellow
$PSStyle.Formatting.Verbose = $PSStyle.Foreground.Green
$PSStyle.Formatting.Debug = $PSStyle.Foreground.Magenta
$PSStyle.Progress.Style = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Directory = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.SymbolicLink = $PSStyle.Foreground.Magenta
$PSStyle.FileInfo.Executable = $PSStyle.Foreground.Green
$PSStyle.FileInfo.Extension.Clear()
$PSStyle.FileInfo.Extension[".c"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".cpp"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".cxx"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".h"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".hpp"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".hxx"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".cmake"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".md"] = $PSStyle.Foreground.Yellow
$PSStyle.FileInfo.Extension[".js"] = $PSStyle.Foreground.Yellow
$PSStyle.FileInfo.Extension[".cjs"] = $PSStyle.Foreground.Yellow
$PSStyle.FileInfo.Extension[".mjs"] = $PSStyle.Foreground.Yellow
$PSStyle.FileInfo.Extension[".jsx"] = $PSStyle.Foreground.Yellow
$PSStyle.FileInfo.Extension[".json"] = $PSStyle.Foreground.Yellow
$PSStyle.FileInfo.Extension[".ps1"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".ts"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".tsx"] = $PSStyle.Foreground.Blue
$PSStyle.FileInfo.Extension[".yml"] = $PSStyle.Foreground.Red
$PSStyle.FileInfo.Extension[".yaml"] = $PSStyle.Foreground.Red

if (($Host.UI.RawUI.WindowSize.Width -lt 54) -or ($Host.UI.RawUI.WindowSize.Height -lt 15))
{
    $style = "InlineView"
}
else { $style = "ListView" }

$PSReadLineOptions = @{
    # AddToHistoryHandler = { return [Microsoft.PowerShell.AddToHistoryOption]::SkipAdding }
    # HistorySaveStyle    = "SaveNothing"
    # PredictionSource    = None
    PredictionViewStyle = $style
    Colors              = @{
        ContinuationPrompt     = $PSStyle.Foreground.Green
        Selection              = $PSStyle.Foreground.Green + $PSStyle.Background.White
        InlinePrediction       = $PSStyle.Foreground.Green
        Emphasis               = $PSStyle.Foreground.Green
        ListPrediction         = $PSStyle.Foreground.Green
        ListPredictionSelected = $PSStyle.Foreground.Green
        Command                = "`e[39m"
        Comment                = "`e[39m"
        Default                = "`e[39m"
        Error                  = "`e[39m"
        Keyword                = "`e[39m"
        Member                 = "`e[39m"
        Number                 = "`e[39m"
        Operator               = "`e[39m"
        Parameter              = "`e[39m"
        String                 = "`e[39m"
        Type                   = "`e[39m"
        Variable               = "`e[39m"
    }
}

Set-PSReadLineOption @PSReadLineOptions

Set-PSReadLineKeyHandler -Key RightArrow -ScriptBlock {
    param($key, $arg)
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
    if ($cursor -lt $line.Length)
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
    }
    else
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
    }
}
