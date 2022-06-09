*** Variables ***
#Login Credentials and Webpage (To be migrated to variable file in the near future)
${Host}                             localhost
${UAT-Host}
${Webpage}                          http://${Host}:3000/
${Browser}                          chromium
${Headless}                         false
&{Browser-Default-Capabilities}     acceptDownloads=true    ignoreHTTPSErrors=true    viewport={'width': 1920, 'height': 1080}
${Default-Timeout}                  30s

#*** SSH Parameters ***
${Device-Host}             200.168.18.99
${SSH-Username}            nvidia
${SSH-Password}            nvidia

#*** Test Parameters ***
${TC002-WorldName2D}           WorldName-2D-2
${TC002-MapName2D}              MapName-2D-2
${TC002-WorldName3D}            WorldName-3D
${TC002-MapName3D}              MapName-3D

${WorldName2D}            WorldName-2D
${MapName2D}              MapName-2D
${WorldName3D}            WorldName-3D
${MapName3D}              MapName-3D

@{LIST}=          1    2    3   4   5   6   7   8   9   10
${ScreenshotPath}         screenshots

