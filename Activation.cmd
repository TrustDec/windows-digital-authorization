    @echo off

    rem author: TrustDec
    rem 推荐MSDN原版镜像:https://msdn.itellyou.cn
    chcp 65001
    set "Apply=%*"
    cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
    title Windows 10 数字权利激活脚本
    pushd "%~dp0"
    setlocal enabledelayedexpansion

    cls
    if /i "%PROCESSOR_IDENTIFIER:~0,3%"=="x86" (
    set bit=x86
    ) else (
    set bit=x64
        )
    echo ---------------------------------------------------------------
    echo     脚本仅支持 Windows 10 系统，其它系统请勿运行此脚本。

    echo     脚本支持激活以下版本 Windows 10，并获取数字权利。
    
    echo ---------------------------------------------------------------

    echo     Windows 10 家庭版、家庭N、家庭单语言版、家庭国家版、Windows 10 S、Windows 10 SN。

    echo     专业版、专业N、专业教育版、专业教育N、专业工作站版、工作站N。

    echo     企业版、企业 （LTSB 2016）、教育版、教育N。

    echo ---------------------------------------------------------------
    echo     激活时请保持电脑连网状态，断网情况下无法使用此方法激活。

    echo     激活可能一次无法成功，遇到无法成功的可以重新运行脚本尝试激活。另外有些精简版系统也可能无法激活。

    echo ---------------------------------------------------------------
    echo     脚本不支持路径中带有空格，请在路径中不含空格的目录下运行。

    echo     切换版本后最后的版本信息显示可能会有延时，请参考输入的 KEY为证。或注销系统后再查看。

    echo ---------------------------------------------------------------
    echo     按任意键开始，或按Ctrl+C退出脚本！
    pause >nul

    :menu
    title Windows 10 数字权利激活脚本－选择功能
    cls
    echo ---------------------------------------------------------------
    echo     请选择任务。
    echo ---------------------------------------------------------------
    echo     [1]一键激活当前版本。

    echo     [2]自定义选择版本激活。

    echo     [3]查看当前系统版本信息。

    echo     [4]安装 KEY（不激活）。

    echo     [5] 卸载系统默认 KEY。

    echo     [6]访问脚本发布帖，（仅限远景注册用户访问）。

    echo     [7]退出脚本。

    echo ---------------------------------------------------------------

    choice /n /c 1234567 /m 请输入数字选择
    cls
    if errorlevel 7 exit
    if errorlevel 6 goto url
    if errorlevel 5 goto uninstall
    if errorlevel 4 goto install
    if errorlevel 3 goto information
    if errorlevel 2 goto Choice
    if errorlevel 1 goto start

    :Choice
    title Windows 10 数字权利激活脚本－选择版本
    cls
    echo ---------------------------------------------------------------
    echo     请选择需要激活的版本
    echo ---------------------------------------------------------------

    echo A= Windows 10 S （安装证书仅限 16299）

    echo B= Windows 10 S N （安装证书仅限 16299）

    echo ---------------------------------------------------------------

    echo 以下版本支持安装 16299和 17134的证书。

    echo C= Windows 10 家庭版

    echo D= Windows 10 家庭 N

    echo E= Windows 10 家庭国家版

    echo F= Windows 10 家庭单语言版

    echo ---------------------------------------------------------------

    echo G= Windows 10 专业版

    echo H= Windows 10 专业 N

    echo I= Windows 10 专业教育版

    echo J= Windows 10 专业教育 N

    echo K= Windows 10 专业工作站版

    echo L= Windows 10 专业工作站 N

    echo ---------------------------------------------------------------

    echo M= Windows 10 教育版

    echo N= Windows 10 教育 N

    echo ---------------------------------------------------------------

    echo O= Windows 10 企业版

    echo P= Windows 10 企业 N

    echo Q= Windows 10 企业 LTSB

    echo R= Windows 10 企业 LTSB N

    echo ---------------------------------------------------------------

    echo.
    set /p pid="请输入对应版本的字母，按 Enter开始"

    cls
    if /i "%pid%"=="a" goto Cloud
    if /i "%pid%"=="b" goto CloudN
    if /i "%pid%"=="c" goto Core
    if /i "%pid%"=="d" goto CoreN
    if /i "%pid%"=="e" goto CoreCountrySpecific
    if /i "%pid%"=="f" goto CoreSingleLanguage
    if /i "%pid%"=="g" goto Professional
    if /i "%pid%"=="h" goto ProfessionalN
    if /i "%pid%"=="i" goto ProfessionalEducation
    if /i "%pid%"=="j" goto ProfessionalEducationN
    if /i "%pid%"=="k" goto ProfessionalWorkstation
    if /i "%pid%"=="l" goto ProfessionalWorkstationN
    if /i "%pid%"=="m" goto Education
    if /i "%pid%"=="n" goto EducationN
    if /i "%pid%"=="o" goto Enterprise
    if /i "%pid%"=="p" goto EnterpriseN
    if /i "%pid%"=="q" goto EnterpriseS
    if /i "%pid%"=="r" goto EnterpriseSN
    echo. & echo 输入错误，按任意键重新输入！
    pause >nul && cls &&goto Choice

    :start
    cls
    wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (echo. & echo 您使用的计算机已永久激活！无需此操作。 & echo 请在未激活的计算机上运行此脚本，或选择激活其它版本。 & echo 按任意键退出脚本！ & pause >nul && exit )

    for /f "tokens=3 delims= " %%i in ('cscript /nologo %SystemRoot%\System32\slmgr.vbs /dli ^| findstr /i "edition"') do (set edition=%%i)
    goto %edition%

    :Cloud
    set sku=178
    set pidkey=V3WVW-N2PV2-CGWC3-34QGF-VMJ2C
    set skus=Cloud
    goto activation

    :CloudN
    set sku=179
    set pidkey=NH9J3-68WK7-6FB93-4K3DF-DJ4F6
    set skus=CloudN
    goto activation

    :Core
    set sku=101
    set pidkey=YTMG3-N6DKC-DKB77-7M9GH-8HVX7
    set skus=Core
    goto activation

    :CoreN
    set sku=98
    set pidkey=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW
    set skus=CoreN
    goto activation

    :CoreCountrySpecific
    set sku=99
    set pidkey=N2434-X9D7W-8PF6X-8DV9T-8TYMD
    set skus=CoreCountrySpecific
    goto activation

    :CoreSingleLanguage
    set sku=100
    set pidkey=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT
    set skus=CoreSingleLanguage
    goto activation

    :Professional
    set sku=48
    set pidkey=VK7JG-NPHTM-C97JM-9MPGT-3V66T
    set skus=Professional
    goto activation

    :ProfessionalN
    set sku=49
    set pidkey=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT
    set skus=ProfessionalN
    goto activation

    :ProfessionalEducation
    set sku=164
    set pidkey=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB
    set skus=ProfessionalEducation
    goto activation

    :ProfessionalEducationN
    set sku=165
    set pidkey=GJTYN-HDMQY-FRR76-HVGC7-QPF8P
    set skus=ProfessionalEducationN
    goto activation

    :ProfessionalWorkstation
    set sku=161
    set pidkey=DXG7C-N36C4-C4HTG-X4T3X-2YV77
    set skus=ProfessionalWorkstation
    goto activation

    :ProfessionalWorkstationN
    set sku=162
    set pidkey=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ
    set skus=ProfessionalWorkstationN
    goto activation

    :Education
    set sku=121
    set pidkey=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY
    set skus=Education
    goto activation

    :EducationN
    set sku=122
    set pidkey=84NGF-MHBT6-FXBX8-QWJK7-DRR8H
    set skus=EducationN
    goto activation

    :Enterprise
    set sku=4
    set pidkey=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C
    set skus=Enterprise
    goto activation

    :EnterpriseN
    set sku=27
    set pidkey=YHMNQ-PPQW2-P8PGP-32643-C372T
    set skus=EnterpriseN
    goto activation

    :EnterpriseS
    set sku=125
    set pidkey=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX
    set skus=EnterpriseS
    goto activation

    :EnterpriseSN
    set sku=126
    set pidkey=C73T8-FNJRG-FTQWK-2JP2R-VMJWR
    set skus=EnterpriseSN

    :activation
    cls
    for /f "tokens=3 delims=." %%a in ('ver') do (set version=%%a)
    if not exist "%SystemRoot%\System32\spp\tokens\skus\%skus%" (
    title Windows 10 数字权利激活脚本－正在安装数字证书
    xcopy /i /y /q %~dp0skus\%version%\%skus% "%SystemRoot%\System32\spp\tokens\skus\%skus%" >nul || goto end
    echo ---------------------------------------------------------------
    echo 正在安装数字证书，此过程时间稍长，请耐心等待完成！
    cscript /nologo %SystemRoot%\System32\slmgr.vbs /rilc >nul
    ) else (
    goto next
        )

    :next
    title Windows 10 数字权利激活脚本－正在激活
    for /f "tokens=3" %%k in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "start"') do (set services=%%k)
    if /i "%services%" gtr "0x3" (
    echo ---------------------------------------------------------------
    echo 正在开启Windows Update服务
    sc config wuauserv start= auto >nul 2>nul
    ) else (
    goto activation1
        )

    :activation1

    echo ---------------------------------------------------------------

    echo      正在安装KEY，请等待完成。

    echo ---------------------------------------------------------------

    cscript /nologo %SystemRoot%\System32\slmgr.vbs /ipk %pidkey% || goto error1
    timeout /nobreak /t 2 >nul
    wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (echo. & echo 您选择的版本已在本计算机上永久激活！无需再次激活。 & echo 请按任意键重新选择！ & pause >nul && goto choice )

    sc start wuauserv >nul 2>nul
    echo ---------------------------------------------------------------
    echo 正在添加注册表
    reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f >nul
    reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d "%sku%" /f >nul
    reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d "1" /f >nul
    reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0%bit%\gatherosstate.exe" /d "^ WIN7RTM" /f >nul

    echo ---------------------------------------------------------------

    echo     正在获取数字门票，请等待完成。

    echo ---------------------------------------------------------------


    start /wait %~dp0%bit%\Gatherosstate.exe
    timeout /nobreak /t 4 >nul
    :Reset
    if not exist %~dp0%bit%\GenuineTicket.xml goto Reset
    clipup -v -o -altto %~dp0%bit%\

    echo ---------------------------------------------------------------
    cscript /nologo %SystemRoot%\system32\slmgr.vbs /ato

    echo ---------------------------------------------------------------
    echo 正在删除注册表
    reg delete "HKLM\SYSTEM\Tokens" /f >nul
    reg delete "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0%bit%\gatherosstate.exe" /f >nul

    :error1
    if /i "%services%" gtr "0x3" (
    echo ---------------------------------------------------------------
    echo 正在禁用 Windows Update服务
    sc stop wuauserv >nul 2>nul
    sc config wuauserv start= disabled >nul 2>nul
    ) else (
    goto information
        )

    :information
    title Windows 10 数字权利激活脚本－版本信息
    echo ---------------------------------------------------------------

    for /f "delims=" %%f in ('wmic os get caption ^| findstr /i "Microsoft"') do (echo %%f)

    for /f "tokens=2-4" %%f in ('ver') do (echo %%f %%g %%h)

for /f "tokens=5 delims= " %%f in ('cscript /nologo %SystemRoot%\System32\slmgr.vbs /dli ^| findstr /i "channel"') do  (echo 产品密钥通道: %%f)

    for /f "skip=3 delims=" %%f in ('cscript /nologo %SystemRoot%\System32\slmgr.vbs /dli') do (echo %%f)

    echo ---------------------------------------------------------------

    pause
exit

    :url
    start "" "http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786788&page=1#pid48314667"
    goto menu

    :install
    title Windows 10 数字权利激活脚本－安装 KEY
    echo ---------------------------------------------------------------

    set /p install="请输入或粘贴需要安装的 KEY，按 Enter安装"

    cls

    echo ---------------------------------------------------------------

    echo      正在安装KEY，请等待完成。

    echo ---------------------------------------------------------------

    cscript /nologo %SystemRoot%\System32\slmgr.vbs /ipk %install% || goto error

    echo ---------------------------------------------------------------

    for /f "tokens=3" %%k in ('cscript /nologo %SystemRoot%\System32\slmgr.vbs /dti') do (set ID=%%k)
    for /f "delims=" %%g in ("%ID%") do (
    set pid0=%%g
    set pid1=!pid0:~0,7!
    set pid2=!pid0:~7,7!
    set pid3=!pid0:~14,7!
    set pid4=!pid0:~21,7!
    set pid5=!pid0:~28,7!
    set pid6=!pid0:~35,7!
    set pid7=!pid0:~42,7!
    set pid8=!pid0:~49,7!
    set pid9=!pid0:~56,7!

    echo 安装 ID: !pid1! !pid2! !pid3! !pid4! !pid5! !pid6! !pid7! !pid8! !pid9!
        )

    :error

    echo ---------------------------------------------------------------

    pause
exit

    :uninstall
    title Windows 10 数字权利激活脚本－卸载 KEY

    echo ---------------------------------------------------------------

    echo     正在卸载默认 KEY，请稍等。

    echo ---------------------------------------------------------------

    cscript /nologo %SystemRoot%\system32\slmgr.vbs /upk

    echo ---------------------------------------------------------------

pause
exit

    :end
    echo ---------------------------------------------------------------

    echo 证书复制失败，请检查 skus目录是否完整，和系统版本是否支持！

    echo ---------------------------------------------------------------

    echo 按任意键退出脚本。

    pause >nul
exit
