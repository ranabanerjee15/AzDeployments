#Install Modules
Install-PackageProvider -Name NuGet -Scope AllUsers -Force -Confirm:$false -Verbose
$modules = @(
    'ExchangeOnlineManagement'
    'ImportExcel'
    'Az'
    'AzureAdPreview'
    'MsOnline'
)

$modules | ForEach-Object {
    Install-Module -Name $_ -Scope AllUsers -AllowClobber -Force -Confirm:$false -ErrorAction SilentlyContinue
}

#Configure Exclusions - Does not pick up on paths correctly

<#

$SystemRoot = $env:SystemRoot
$SystemDrive = $env:SystemDrive
$ExInstallPath = $env:ExchangeInstallPath

$FolderExclusions = @(
    "$($SystemRoot)\Cluster"
    "$($ExInstallPath)ClientAccess\OAB"
    "$($ExInstallPath)FIP-FS"
    "$($ExInstallPath)GroupMetrics"
    "$($ExInstallPath)Logging"
    "$($ExInstallPath)Mailbox"
    "$($ExInstallPath)TransportRoles\Data\Adam"
    "$($ExInstallPath)TransportRoles\Data\IpFilter"
    "$($ExInstallPath)TransportRoles\Data\Queue"
    "$($ExInstallPath)TransportRoles\Data\SenderReputation"
    "$($ExInstallPath)TransportRoles\Data\Temp"
    "$($ExInstallPath)TransportRoles\Logs"
    "$($ExInstallPath)TransportRoles\Pickup"
    "$($ExInstallPath)TransportRoles\Replay"
    "$($ExInstallPath)UnifiedMessaging\Grammars"
    "$($ExInstallPath)UnifiedMessaging\Prompts"
    "$($ExInstallPath)UnifiedMessaging\Temp"
    "$($ExInstallPath)UnifiedMessaging\Voicemail"
    "$($ExInstallPath)Working\OleConverter"
    "$($SystemDrive)\inetpub\temp\IIS Temporary Compressed Files"
    "$($SystemDrive)\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"
    "$($SystemRoot)\System32\Inetsrv"
    "$($SystemRoot)\System32\Inetsrv"
    #"$($SystemRoot)\Temp\*
)
#>

$FolderExclusions = @(
    "C:\Windows\Cluster"
    "C:\Program Files\Microsoft\Exchange Server\V15\ClientAccess\OAB"
    "C:\Program Files\Microsoft\Exchange Server\V15\FIP-FS"
    "C:\Program Files\Microsoft\Exchange Server\V15\GroupMetrics"
    "C:\Program Files\Microsoft\Exchange Server\V15\Logging"
    "C:\Program Files\Microsoft\Exchange Server\V15\Mailbox"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Data\Adam"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Data\IpFilter"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Data\Queue"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Data\SenderReputation"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Data\Temp"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Logs"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Pickup"
    "C:\Program Files\Microsoft\Exchange Server\V15\TransportRoles\Replay"
    "C:\Program Files\Microsoft\Exchange Server\V15\UnifiedMessaging\Grammars"
    "C:\Program Files\Microsoft\Exchange Server\V15\UnifiedMessaging\Prompts"
    "C:\Program Files\Microsoft\Exchange Server\V15\UnifiedMessaging\Temp"
    "C:\Program Files\Microsoft\Exchange Server\V15\UnifiedMessaging\Voicemail"
    "C:\Program Files\Microsoft\Exchange Server\V15\Working\OleConverter"
    "C:\inetpub\temp\IIS Temporary Compressed Files"
    "C:\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"
    "C:\Windows\System32\Inetsrv"
    "C:\Windows\System32\Inetsrv"
)

$ProcessExclusions = @(
    "ComplianceAuditService.exe"
    "Dsamain.exe"
    "EdgeTransport.exe"
    "fms.exe"
    "hostcontrollerservice.exe"
    "inetinfo.exe"
    "Microsoft.Exchange.AntispamUpdateSvc.exe"
    "Microsoft.Exchange.ContentFilter.Wrapper.exe"
    "Microsoft.Exchange.Diagnostics.Service.exe"
    "Microsoft.Exchange.Directory.TopologyService.exe"
    "Microsoft.Exchange.EdgeCredentialSvc.exe"
    "Microsoft.Exchange.EdgeSyncSvc.exe"
    "Microsoft.Exchange.Imap4.exe"
    "Microsoft.Exchange.Imap4service.exe"
    "Microsoft.Exchange.Notifications.Broker.exe"
    "Microsoft.Exchange.Pop3.exe"
    "Microsoft.Exchange.Pop3service.exe"
    "Microsoft.Exchange.ProtectedServiceHost.exe"
    "Microsoft.Exchange.RPCClientAccess.Service.exe"
    "Microsoft.Exchange.Search.Service.exe"
    "Microsoft.Exchange.Servicehost.exe"
    "Microsoft.Exchange.Store.Service.exe"
    "Microsoft.Exchange.Store.Worker.exe"
    "Microsoft.Exchange.UM.CallRouter.exe"
    "MSExchangeCompliance.exe"
    "MSExchangeDagMgmt.exe"
    "MSExchangeDelivery.exe"
    "MSExchangeFrontendTransport.exe"
    "MSExchangeHMHost.exe"
    "MSExchangeHMWorker.exe"
    "MSExchangeMailboxAssistants.exe"
    "MSExchangeMailboxReplication.exe"
    "MSExchangeRepl.exe"
    "MSExchangeSubmission.exe"
    "MSExchangeTransport.exe"
    "MSExchangeTransportLogSearch.exe"
    "MSExchangeThrottling.exe"
    "Noderunner.exe"
    "OleConverter.exe"
    "ParserServer.exe"
    "Powershell.exe"
    "ScanEngineTest.exe"
    "ScanningProcess.exe"
    "UmService.exe"
    "UmWorkerProcess.exe"
    "UpdateService.exe"
    "W3wp.exe"
    "wsbexchange.exe"
)

$ExtensionExclusions = @(
    ".chk"
    ".edb"
    ".jfm"
    ".jrs"
    ".log"
    ".que"
    ".dsc"
    ".txt"
    ".cfg"
    ".grxml"
    ".lzx"
)

$paramAddMpPreference = @{
    ExclusionPath      = $FolderExclusions
    ExclusionProcess   = $ProcessExclusions
    ExclusionExtension = $ExtensionExclusions
    Verbose            = $true
    ErrorAction        = 'SilentlyContinue'
}

Add-MpPreference @paramAddMpPreference

# Add Address Book - Did not Work
<#
Import-Module "C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1"; Connect-ExchangeServer -auto -ClientApplication:ManagementShell
$paramNewEmailAddressPolicy = @{
    Name                         = 'Lab01.Online'
    IncludedRecipients           = 'AllRecipients'
    RecipientContainer           = "Lab01.local/LAB01"
    EnabledEmailAddressTemplates = "SMTP:%g.%s@Lab01.online"
    Confirm                      = $false
    Priority                     = 1
}


New-EmailAddressPolicy @paramNewEmailAddressPolicy
#>