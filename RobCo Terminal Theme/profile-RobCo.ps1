#############################
## RFobCo Terminal Profile ##
#############################

#region Functions

# This one lets us present output one char at a time
function get-easyview{

    param(
        [int]$Milliseconds= 50,
        [ValidateSet("Line","Character")] 
        [String] 
        $Pace = "Character"
    )

    If($pace -eq "Character"){
        $text = [char[]]($input | Out-String)
        $parameters = @{NoNewline = $true}
    } Else {
        $text = ($input | out-string) -split "`r`n"
        $parameters = @{NoNewline = $false}
    }

    $text | ForEach-Object{
        Write-Host $_ @parameters
        if($_ -notmatch "^\s+$"){Start-Sleep -Milliseconds $Milliseconds}
    }
}

# Set the correct prompt
function global:prompt {
    return "> "
}

# Generate random line of unicode chars
function Get-Nonsense {

    param(
        [int]$number = 15
    )
    $Line = @()
    for ($i = 0; $i -lt $number; $i++) {
        $Uni = $([char](Get-Random -Minimum 1 -Maximum 2000))
        $Line += $Uni
    }

    $line
}

# Generateline of unicode and a word - 35% chance of word, 65% chance of random unicode line
Function Get-WordClue {

    $Dice = Get-random -Minimum 1 -Maximum 100

    if ($Dice -ge 65) {
        $Words = @("$(Get-random $verbs)",$(Get-random $nouns),"$(Get-Random $adjectives)")
        $chosenWord = ($words[$(Get-random -Minimum 0 -Maximum 2)]).ToUpper()
        $remainingChar = 15 - ($chosenWord | Measure-Object -Character).Characters
        $preChars = Get-Random -Minimum 0 -Maximum $remainingChar
        $preBit = Get-Nonsense -number $preChars
        $filler = Get-Nonsense -number $($remainingChar - $preChars)
        $preBit+$chosenWord+$filler
    } else {Get-Nonsense}
}


#endregion Functions

#region Load Vars
$adjectives = ((Invoke-WebRequest -URI "https://swearierlistofswears.azurewebsites.net/adjectives.html").Content) -split "," -replace "`r`n", "" | Select-Object -Unique
$verbs = ((Invoke-WebRequest -URI "https://swearierlistofswears.azurewebsites.net/Verbs.html").Content) -split "," -replace "`r`n", "" | Select-Object -Unique
$nouns = ((Invoke-WebRequest -URI "https://swearierlistofswears.azurewebsites.net/Nouns.html").Content) -split "," -replace "`r`n", "" | Select-Object -Unique

$OriginalProgressPreference = $Global:ProgressPreference
$Global:ProgressPreference = 'SilentlyContinue'

#endregion Load Vars

#region Welcome Messages
$welcomeMessage = "WELCOME TO THE $((Get-DnsClientGlobalSetting).suffixsearchlist[0].split(".")[0].toupper()) (TM) TERMINAL
`n
> CURRENT DATE: $(get-date -format dd/MM/yyyy)
> SET ACCESS LEVEL (SYSADMIN)
> TESTING DOMAIN CONNECTIVITY...
`n
"
$welcomeMessage | get-easyview -Milliseconds 50

$sysinfo = "$($ipV4 = Test-netConnection -ComputerName dcupb1701 -ErrorAction Ignore)
Initializing $((Get-DnsClientGlobalSetting).suffixsearchlist[0].split(".")[0]) (TM) SYSLOG Boot Agent
BIOS VERSION 69.420
Copyright Psychosapien @ https://github.com/Psychosapien
Client Hostname: $(hostname)
Memory Alloc: $((systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim())
Local IPv4: $((Test-Connection -ComputerName (hostname) -Count 1).IPV4Address)
Domain IPv4: $(if ($ipv4) {$ipv4.SourceAddress.IPAddress} else {"WARNING - NO DOMAIN CONNECTIVITY"})
`n`n
"

$sysinfo | get-easyview -Milliseconds 50

$dotdotdot = "...
......
........."

$dotdotdot | get-easyview -Milliseconds 200

start-sleep -Seconds 1

Clear-Host

#endregion Welcome Messages

#region Password Selection
$GameMessage = "> AUTHENTICATING $((whoami).toUpper())
...
......
.........

> PASSWORD SELECTION REQUIRED"

$GameMessage | get-easyview -Milliseconds 50

$Passwords=
"
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t$(Get-WordClue)`t`t`t`t
"

$Passwords | get-easyview -Milliseconds 100 -Pace Line

$splits = $passwords.split()
$possiblePasswords = @()

foreach ($i in $splits) {$chars =  ($i |  Measure-Object -Character).Characters

    if ($chars -ge 8) {$possiblePasswords += $i}
}

$attempts = 5

$actualPassword = Get-Random $possiblePasswords

do {
    if ($Attempts -eq 1) {
        $Warning = "`n> THIS IS YOUR LAST CHANCE SO I'LL BE NICE...
        
THE FIRST CHARACTER IS $($actualPassword[0])`n"

$Warning | get-easyview -Milliseconds 50
    }
    if ($attempts -eq 0) {
        
        $warning = "> WARNING!!! MAXIMUM ATTEMPTS EXCEEDED
        
...
        
> TERMINAL WILL LOCK IN"
        
        $warning | get-easyview -Milliseconds 50

        $CountDown = "5...
4...
3...
2...
1...

> TERMINAL LOCKED, HAVE A NICE DAY"

        $CountDown | get-easyview -Milliseconds 600

        stop-process -Id $PID -Force
    }

    $ChosenPassword = Read-Host "> PLEASE TYPE THE CORRECT PASSWORD AND PRESS ENTER. ATTEMPTS REMAINING $("$attempts" + '/' + '5')"
    if ($chosenpassword -ne $actualPassword) {$attempts = $attempts -1}
}
 until (($ChosenPassword -eq $actualPassword))

$Success = ">AUTHENTICATION COMPLETE
...
......
.........
> WELCOME $((whoami).toUpper().split('\')[1])"

$Success | get-easyview -Milliseconds 50
Start-Sleep -Seconds 1

Clear-Host

## CHANGE THIS BIT TO REFLECT WHATEVER TASK YOU WANT THE SCRIPT TO COMPLETE AFTER PASSING THE LITTLE GAME
$Initiate = "> OPENING SSH TUNNEL TO SERVER
> PLEASE ENTER ADMINISTRATOR PASSWORD TO CONTINUE...
"

$Initiate | get-easyview -Milliseconds 50

$Global:ProgressPreference = $OriginalProgressPreference

##PUT SOME KIND OF SCRIPT OR COMMAND HERE

#region Password Selection