; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "ssl-vpn-client"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "My company, Inc."
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\ssl-vpn-client.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\src\ssl_vpn_client.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\ssl-vpn-client.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\ssl-vpn-client"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\bearer"
  SetOverwrite try
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\bearer\qgenericbearer.dll"
  SetOutPath "$INSTDIR"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\D3Dcompiler_47.dll"
  SetOutPath "$INSTDIR\iconengines"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\iconengines\qsvgicon.dll"
  SetOutPath "$INSTDIR\imageformats"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qgif.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qicns.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qico.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qjpeg.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qsvg.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qtga.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qtiff.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qwbmp.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\imageformats\qwebp.dll"
  SetOutPath "$INSTDIR"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libEGL.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libffi-6.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libgcc_s_seh-1.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libGLESV2.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libgmp-10.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libgnutls-30.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libhogweed-4.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libiconv-2.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libidn2-4.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libintl-8.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\liblz4.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\liblzma-5.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libnettle-6.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libopenconnect-5.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libp11-kit-0.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libproxy-1.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libstdc++-6.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libstoken-1.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libtasn1-6.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libunistring-2.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libwinpthread-1.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\libxml2-2.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\opengl32sw.dll"
  SetOutPath "$INSTDIR\platforms"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\platforms\qwindows.dll"
  SetOutPath "$INSTDIR"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\Qt5Core.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\Qt5Gui.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\Qt5Network.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\Qt5Svg.dll"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\Qt5Widgets.dll"
  SetOverwrite on
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\ssl-vpn-client.exe"
  CreateDirectory "$SMPROGRAMS\ssl-vpn-client"
  CreateShortCut "$SMPROGRAMS\ssl-vpn-client\ssl-vpn-client.lnk" "$INSTDIR\ssl-vpn-client.exe"
  CreateShortCut "$DESKTOP\ssl-vpn-client.lnk" "$INSTDIR\ssl-vpn-client.exe"
  SetOutPath "$INSTDIR\styles"
  SetOverwrite try
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\styles\qwindowsvistastyle.dll"
  SetOutPath "$INSTDIR\translations"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_ar.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_bg.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_ca.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_cs.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_da.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_de.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_en.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_es.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_fi.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_fr.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_gd.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_he.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_hu.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_it.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_ja.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_ko.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_lv.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_pl.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_ru.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_sk.qm"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\translations\qt_uk.qm"
  SetOutPath "$INSTDIR"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\vpnc-script-win.js"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\vpnc-script.js"
  File "..\..\build-openconnect-gui-Desktop_Qt_5_12_2_MinGW_64_bit-Release\release\zlib1.dll"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\ssl-vpn-client\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\ssl-vpn-client.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\ssl-vpn-client.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从你的计算机移除。"
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "你确实要完全移除 $(^Name) ，其及所有的组件？" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\zlib1.dll"
  Delete "$INSTDIR\vpnc-script.js"
  Delete "$INSTDIR\vpnc-script-win.js"
  Delete "$INSTDIR\translations\qt_uk.qm"
  Delete "$INSTDIR\translations\qt_sk.qm"
  Delete "$INSTDIR\translations\qt_ru.qm"
  Delete "$INSTDIR\translations\qt_pl.qm"
  Delete "$INSTDIR\translations\qt_lv.qm"
  Delete "$INSTDIR\translations\qt_ko.qm"
  Delete "$INSTDIR\translations\qt_ja.qm"
  Delete "$INSTDIR\translations\qt_it.qm"
  Delete "$INSTDIR\translations\qt_hu.qm"
  Delete "$INSTDIR\translations\qt_he.qm"
  Delete "$INSTDIR\translations\qt_gd.qm"
  Delete "$INSTDIR\translations\qt_fr.qm"
  Delete "$INSTDIR\translations\qt_fi.qm"
  Delete "$INSTDIR\translations\qt_es.qm"
  Delete "$INSTDIR\translations\qt_en.qm"
  Delete "$INSTDIR\translations\qt_de.qm"
  Delete "$INSTDIR\translations\qt_da.qm"
  Delete "$INSTDIR\translations\qt_cs.qm"
  Delete "$INSTDIR\translations\qt_ca.qm"
  Delete "$INSTDIR\translations\qt_bg.qm"
  Delete "$INSTDIR\translations\qt_ar.qm"
  Delete "$INSTDIR\styles\qwindowsvistastyle.dll"
  Delete "$INSTDIR\ssl-vpn-client.exe"
  Delete "$INSTDIR\Qt5Widgets.dll"
  Delete "$INSTDIR\Qt5Svg.dll"
  Delete "$INSTDIR\Qt5Network.dll"
  Delete "$INSTDIR\Qt5Gui.dll"
  Delete "$INSTDIR\Qt5Core.dll"
  Delete "$INSTDIR\platforms\qwindows.dll"
  Delete "$INSTDIR\opengl32sw.dll"
  Delete "$INSTDIR\libxml2-2.dll"
  Delete "$INSTDIR\libwinpthread-1.dll"
  Delete "$INSTDIR\libunistring-2.dll"
  Delete "$INSTDIR\libtasn1-6.dll"
  Delete "$INSTDIR\libstoken-1.dll"
  Delete "$INSTDIR\libstdc++-6.dll"
  Delete "$INSTDIR\libproxy-1.dll"
  Delete "$INSTDIR\libp11-kit-0.dll"
  Delete "$INSTDIR\libopenconnect-5.dll"
  Delete "$INSTDIR\libnettle-6.dll"
  Delete "$INSTDIR\liblzma-5.dll"
  Delete "$INSTDIR\liblz4.dll"
  Delete "$INSTDIR\libintl-8.dll"
  Delete "$INSTDIR\libidn2-4.dll"
  Delete "$INSTDIR\libiconv-2.dll"
  Delete "$INSTDIR\libhogweed-4.dll"
  Delete "$INSTDIR\libgnutls-30.dll"
  Delete "$INSTDIR\libgmp-10.dll"
  Delete "$INSTDIR\libGLESV2.dll"
  Delete "$INSTDIR\libgcc_s_seh-1.dll"
  Delete "$INSTDIR\libffi-6.dll"
  Delete "$INSTDIR\libEGL.dll"
  Delete "$INSTDIR\imageformats\qwebp.dll"
  Delete "$INSTDIR\imageformats\qwbmp.dll"
  Delete "$INSTDIR\imageformats\qtiff.dll"
  Delete "$INSTDIR\imageformats\qtga.dll"
  Delete "$INSTDIR\imageformats\qsvg.dll"
  Delete "$INSTDIR\imageformats\qjpeg.dll"
  Delete "$INSTDIR\imageformats\qico.dll"
  Delete "$INSTDIR\imageformats\qicns.dll"
  Delete "$INSTDIR\imageformats\qgif.dll"
  Delete "$INSTDIR\iconengines\qsvgicon.dll"
  Delete "$INSTDIR\D3Dcompiler_47.dll"
  Delete "$INSTDIR\bearer\qgenericbearer.dll"

  Delete "$SMPROGRAMS\ssl-vpn-client\Uninstall.lnk"
  Delete "$DESKTOP\ssl-vpn-client.lnk"
  Delete "$SMPROGRAMS\ssl-vpn-client\ssl-vpn-client.lnk"

  RMDir "$SMPROGRAMS\ssl-vpn-client"
  RMDir "$INSTDIR\translations"
  RMDir "$INSTDIR\styles"
  RMDir "$INSTDIR\platforms"
  RMDir "$INSTDIR\imageformats"
  RMDir "$INSTDIR\iconengines"
  RMDir "$INSTDIR\bearer"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd