#!/bin/bash
scriptName="UUP Converter v0.7.2"
UUP_CONVERTER_SCRIPT=1

export PATH=${PATH}:/usr/sbin

if [ -f `dirname $0`/convert_ve_plugin ]; then
  . `dirname $0`/convert_ve_plugin
fi

if [ -f `dirname $0`/convert_config_linux ] && [ `uname` == "Linux" ]; then
  . `dirname $0`/convert_config_linux
elif [ -f `dirname $0`/convert_config_macos ] && [ `uname` == "Darwin" ]; then
  . `dirname $0`/convert_config_macos
else
  VIRTUAL_EDITIONS_LIST="CoreSingleLanguage Enterprise EnterpriseN Education \
  EducationN ProfessionalEducation ProfessionalEducationN \
  ProfessionalWorkstation ProfessionalWorkstationN ServerRdsh IoTEnterprise \
  CloudEdition CloudEditionN"
fi

editions='analogonecore
andromeda
cloud
cloude
clouden
cloudn
cloudedition
cloudeditionn
core
corecountryspecific
coren
coresinglelanguage
coresystemserver
education
educationn
embedded
embeddede
embeddedeeval
embeddedeval
enterprise
enterpriseeval
enterpriseg
enterprisegn
enterprisen
enterpriseneval
enterprises
enterpriseseval
enterprisesn
enterprisesneval
holographic
hubos
iotenterprise
iotenterprises
iotos
iotuap
lite
mobilecore
onecoreupdateos
ppipro
professional
professionalcountryspecific
professionaleducation
professionaleducationn
professionaln
professionalsinglelanguage
professionalworkstation
professionalworkstationn
serverarm64
serverarm64core
serverazurecor
serverazurecorcore
serverazurenano
serverazurenanocore
serverazurestackhcicor
servercloudstorage
servercloudstoragecore
serverdatacenter
serverdatacenteracor
serverdatacenteracorcore
serverdatacentercor
serverdatacentercorcore
serverdatacentercore
serverdatacentereval
serverdatacenterevalcor
serverdatacenterevalcorcore
serverdatacenterevalcore
serverdatacenternano
serverdatacenternanocore
serverhypercore
serverrdsh
serverrdshcore
serversolution
serversolutioncore
serverstandard
serverstandardacor
serverstandardacorcore
serverstandardcor
serverstandardcorcore
serverstandardcore
serverstandardeval
serverstandardevalcor
serverstandardevalcorcore
serverstandardevalcore
serverstandardnano
serverstandardnanocore
serverstoragestandard
serverstoragestandardcore
serverstoragestandardeval
serverstoragestandardevalcore
serverstorageworkgroup
serverstorageworkgroupcore
serverstorageworkgroupeval
serverstorageworkgroupevalcore
serverturbine
serverturbinecor
serverweb
serverwebcore
starter
startern'

bootSourcesList='sources/alert.gif
sources/api-ms-win-core-apiquery-l1-1-0.dll
sources/api-ms-win-downlevel-advapi32-l1-1-0.dll
sources/api-ms-win-downlevel-advapi32-l1-1-1.dll
sources/api-ms-win-downlevel-advapi32-l2-1-0.dll
sources/api-ms-win-downlevel-advapi32-l2-1-1.dll
sources/api-ms-win-downlevel-advapi32-l3-1-0.dll
sources/api-ms-win-downlevel-advapi32-l4-1-0.dll
sources/api-ms-win-downlevel-kernel32-l1-1-0.dll
sources/api-ms-win-downlevel-kernel32-l2-1-0.dll
sources/api-ms-win-downlevel-ole32-l1-1-0.dll
sources/api-ms-win-downlevel-ole32-l1-1-1.dll
sources/api-ms-win-downlevel-shlwapi-l1-1-0.dll
sources/api-ms-win-downlevel-shlwapi-l1-1-1.dll
sources/api-ms-win-downlevel-user32-l1-1-0.dll
sources/api-ms-win-downlevel-user32-l1-1-1.dll
sources/api-ms-win-downlevel-version-l1-1-0.dll
sources/appcompat.xsl
sources/appcompat_bidi.xsl
sources/appcompat_detailed_bidi_txt.xsl
sources/appcompat_detailed_txt.xsl
sources/appraiser.dll
sources/ARUNIMG.dll
sources/arunres.dll
sources/autorun.dll
sources/bcd.dll
sources/bootsvc.dll
sources/cmisetup.dll
sources/compatctrl.dll
sources/compatprovider.dll
sources/compliance.ini
sources/cryptosetup.dll
sources/diager.dll
sources/diagnostic.dll
sources/diagtrack.dll
sources/diagtrackrunner.exe
sources/dism.exe
sources/dismapi.dll
sources/dismcore.dll
sources/dismcoreps.dll
sources/dismprov.dll
sources/ext-ms-win-advapi32-encryptedfile-l1-1-0.dll
sources/folderprovider.dll
sources/hwcompat.dll
sources/hwcompat.txt
sources/hwcompatPE.txt
sources/hwexclude.txt
sources/hwexcludePE.txt
sources/hwreqchk.dll
sources/idwbinfo.txt
sources/imagelib.dll
sources/imagingprovider.dll
sources/input.dll
sources/lang.ini
sources/locale.nls
sources/logprovider.dll
sources/MediaSetupUIMgr.dll
sources/ndiscompl.dll
sources/nlsbres.dll
sources/ntdsupg.dll
sources/offline.xml
sources/pnpibs.dll
sources/reagent.admx
sources/reagent.dll
sources/reagent.xml
sources/rollback.exe
sources/schema.dat
sources/segoeui.ttf
sources/ServicingCommon.dll
sources/setup.exe
sources/setupcompat.dll
sources/SetupCore.dll
sources/SetupHost.exe
sources/SetupMgr.dll
sources/SetupPlatform.cfg
sources/SetupPlatform.dll
sources/SetupPlatform.exe
sources/SetupPrep.exe
sources/SmiEngine.dll
sources/spflvrnt.dll
sources/spprgrss.dll
sources/spwizeng.dll
sources/spwizimg.dll
sources/spwizres.dll
sources/sqmapi.dll
sources/testplugin.dll
sources/unattend.dll
sources/unbcl.dll
sources/upgloader.dll
sources/upgrade_frmwrk.xml
sources/utcapi.dll
sources/uxlib.dll
sources/uxlibres.dll
sources/vhdprovider.dll
sources/w32uiimg.dll
sources/w32uires.dll
sources/warning.gif
sources/wdsclient.dll
sources/wdsclientapi.dll
sources/wdscommonlib.dll
sources/wdscore.dll
sources/wdscsl.dll
sources/wdsimage.dll
sources/wdstptc.dll
sources/wdsutil.dll
sources/wimgapi.dll
sources/wimprovider.dll
sources/win32ui.dll
sources/WinDlp.dll
sources/winsetup.dll
sources/wpx.dll
sources/xmllite.dll
sources/..-.*/appraiser.dll.mui
sources/..-.*/arunres.dll.mui
sources/..-.*/cmisetup.dll.mui
sources/..-.*/compatctrl.dll.mui
sources/..-.*/compatprovider.dll.mui
sources/..-.*/dism.exe.mui
sources/..-.*/dismapi.dll.mui
sources/..-.*/dismcore.dll.mui
sources/..-.*/dismprov.dll.mui
sources/..-.*/folderprovider.dll.mui
sources/..-.*/imagingprovider.dll.mui
sources/..-.*/input.dll.mui
sources/..-.*/logprovider.dll.mui
sources/..-.*/MediaSetupUIMgr.dll.mui
sources/..-.*/nlsbres.dll.mui
sources/..-.*/pnpibs.dll.mui
sources/..-.*/reagent.adml
sources/..-.*/reagent.dll.mui
sources/..-.*/rollback.exe.mui
sources/..-.*/setup.exe.mui
sources/..-.*/setup_help_upgrade_or_custom.rtf
sources/..-.*/setupcompat.dll.mui
sources/..-.*/SetupCore.dll.mui
sources/..-.*/SetupMgr.dll.mui
sources/..-.*/setupplatform.exe.mui
sources/..-.*/SetupPrep.exe.mui
sources/..-.*/smiengine.dll.mui
sources/..-.*/spwizres.dll.mui
sources/..-.*/upgloader.dll.mui
sources/..-.*/uxlibres.dll.mui
sources/..-.*/vhdprovider.dll.mui
sources/..-.*/vofflps.rtf
sources/..-.*/vofflps_server.rtf
sources/..-.*/w32uires.dll.mui
sources/..-.*/wdsclient.dll.mui
sources/..-.*/wdsimage.dll.mui
sources/..-.*/wimgapi.dll.mui
sources/..-.*/wimprovider.dll.mui
sources/..-.*/WinDlp.dll.mui
sources/..-.*/winsetup.dll.mui'

infoColor="\033[1;94m"
errorColor="\033[1;91m"
resetColor="\033[0m"

if [ "$1" == "-?" -o "$1" == "--help" -o "$1" == "-h" ]; then
  echo "Usage:"
  echo "$0 [compression] [uups_directory] [create_virtual_editions]"
  echo ""
  echo -e "${infoColor}compression options:${resetColor}"
  echo "wim - standard compression (default)"
  echo "esd - solid compression"
  echo ""
  echo -e "${infoColor}create_virtual_editions options:${resetColor}"
  echo "0 - do not create virtual editions (default)"
  echo "1 - create virtual edtitions"
  echo ""
  if [ `uname` == "Linux" ]; then
    echo -e "${infoColor}convert_config_linux file${resetColor}"
  elif [ `uname` == "Darwin" ]; then
    echo -e "${infoColor}convert_config_macos file${resetColor}"
  fi
  echo "This file can be used to configure some advanced options of this script."
  echo "It is required to place configuration in the same directory as script."
  echo ""
  echo "Possible configuration options:"
  echo "VIRTUAL_EDITIONS_LIST='space delimited editions sequence'"
  echo ""
  echo -e "${infoColor}List of editions created if you enable virtual edtitions creation:${resetColor}"
  for edition in $VIRTUAL_EDITIONS_LIST; do
    echo "- $edition"
  done
  echo "When VIRTUAL_EDITIONS_LIST is not configured, this list contains all editions."
  exit
fi

for prog in aria2c cabextract wimlib-imagex chntpw; do
  which $prog &>/dev/null 2>&1 && continue;

  echo "$prog does not seem to be installed"
  echo "Check the readme.md for details"
  exit 1
done

mkiso_present=0
which genisoimage &>/dev/null && mkiso_present=1
which mkisofs &>/dev/null && mkiso_present=1

if [ $mkiso_present -eq 0 ]; then
  echo "genisoimage nor mkisofs does seem to be installed"
  echo "Check the readme.md for details"
  exit 1
fi

if ! [ -z $1 ]; then
  type="$1"
else
  type="wim"
fi

if ! [ "$type" == "wim" -o "$type" == "esd" ]; then
  echo -e "$errorColor""Incorrect compression type.""$resetColor"
  echo "Possible options: wim, esd"
  exit 1
fi

if ! [ -z $2 ]; then
  uupDir="$2"
else
  uupDir="UUPs"
fi

if ! [ -z $3 ]; then
  runVirtualEditions="$3"
else
  runVirtualEditions=0
fi

if ! [ -d "$uupDir" ]; then
  echo -e "$errorColor""Specified directory containing UUP files does not exist!""$resetColor"
  exit 1
fi

if [ "$type" == "esd" ]; then
  compressParam="--solid"
else
  compressParam="--compress=maximum"
  type="wim"
fi

function cleanup() {
  rm -rf ISODIR
  rm -rf "$tempDir"
}

function errorHandler() {
  if [ $1 != 0 ]; then
    echo -e "${errorColor}$2${resetColor}"
    cleanup
    exit 1
  fi
}

function version() { 
  echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

if [ -e ISODIR ]; then
  rm -rf ISODIR
fi

list=
for i in $editions; do
    list="$list -ie \"$i""_..-.*.esd\""
done

metadataFiles=$(find "$uupDir" 2>/dev/null | eval grep $list)
if [ $? != 0 ]; then
  echo -e "$errorColor""No metadata ESDs found.""$resetColor"
  exit 1
fi

list=

firstMetadata=$(head -1 <<< "$metadataFiles")
getLang=`wimlib-imagex info "$firstMetadata" 3`
lang=`grep -i "^Default Language:" <<< "$getLang" | sed "s/.*  //g"`
#lang=$(grep -i "_..-.*.esd" <<< "$metadataFiles" | head -1 | tr '[:upper:]' '[:lower:]' | sed 's/.*_//g;s/.esd//g')
metadataFiles=$(grep -i "$lang" <<< "$metadataFiles" | sort | uniq)
firstMetadata=$(head -1 <<< "$metadataFiles")

tempDir=`mktemp -d`
extractDir="$tempDir/extract"

echo -e "\033[1m$scriptName\033[0m"

updatesDetected=false
for file in `find "$uupDir" -type f -iname "*windows1*-kb*.cab" -or -iname "ssu-*.cab"`; do
  updatesDetected=true
done

if [ $updatesDetected == true ]; then
  echo -e "\033[33mNote: This script does not and cannot support the integration of updates.\nUse the Windows version of the converter to integrate updates."
fi

if [ $runVirtualEditions -eq 1 ] && [ "$VIRTUAL_EDITIONS_PLUGIN_LOADED" != "1" ]; then
  echo "Virtual editions will be not created, because plugin isn't loaded."
  runVirtualEditions=0
fi

echo ""
cabextractVersion=$(cabextract --version | cut -d ' ' -f 3)
if [ $(version $cabextractVersion) -ge $(version "1.10") ] ; then
  keepSymlinks="-k"
else
  keepSymlinks=""
fi
for file in `find "$uupDir" -type f -iname "*.cab" -not -iname "*windows1*-kb*.cab" -not -iname "ssu-*.cab" -not -iname "*desktopdeployment*.cab" -not -iname "*aggregatedmetadata*.cab"`; do
  fileName=`basename $file .cab`
  echo -e "$infoColor""CAB -> ESD:""$resetColor"" $fileName"

  mkdir "$extractDir"
  cabextract $keepSymlinks -d "$extractDir" "$file" >/dev/null 2>/dev/null
  errorHandler $? "Failed to extract $fileName.cab"

  wimlib-imagex capture "$extractDir" "$tempDir/$fileName.esd" \
    --no-acls --norpfix "Edition Package" "Edition Package" >/dev/null

  errorHandler $? "Failed to create $fileName.esd"

  rm -rf "$extractDir"
done

fileName=
file=
extractDir=

export WIMLIB_IMAGEX_IGNORE_CASE=1
mkdir ISODIR

echo ""
echo -e "$infoColor""Creating ISO structure...""$resetColor"

wimlib-imagex apply "$firstMetadata" 1 ISODIR --no-acls --no-attributes 2>/dev/null
errorHandler $? "Failed to create ISO structure"

echo ""
echo -e "$infoColor""Exporting winre.wim...""$resetColor"

wimlib-imagex export "$firstMetadata" 2 "$tempDir/winre.wim" \
  --compress=maximum --boot

errorHandler $? "Failed to export winre.wim"

echo ""
echo -e "$infoColor""Creating boot.wim...""$resetColor"
cp "$tempDir/winre.wim" ISODIR/sources/boot.wim

wimlib-imagex info ISODIR/sources/boot.wim 1 "Microsoft Windows PE" "Microsoft Windows PE" \
  --image-property FLAGS=9 >/dev/null

wimlib-imagex extract ISODIR/sources/boot.wim 1 --dest-dir="$tempDir" \
  "/Windows/System32/config/SOFTWARE" --no-acls >/dev/null

errorHandler $? "Failed to extract registry"

echo 'cd Microsoft\Windows NT\CurrentVersion
nv 1 SystemRoot
ed SystemRoot
X:\$Windows.~bt\Windows
cd WinPE
nv 1 InstRoot
ed InstRoot
X:\$Windows.~bt
q
y' | chntpw -e "$tempDir/SOFTWARE" >/dev/null

wimlib-imagex update ISODIR/sources/boot.wim 1 \
  --command "add $tempDir/SOFTWARE /Windows/System32/config/SOFTWARE" >/dev/null

wimlib-imagex extract ISODIR/sources/boot.wim 1 "/Windows/System32/winpe.jpg" \
  --no-acls --dest-dir="ISODIR/sources" >/dev/null 2>/dev/null

bckimg=background_cli.bmp
if [ -e ./ISODIR/sources/background_svr.bmp ]; then
  bckimg=background_svr.bmp
elif [ -e ./ISODIR/sources/background_cli.png ]; then
  bckimg=background_cli.png
elif [ -e ./ISODIR/sources/background_svr.png ]; then
  bckimg=background_svr.png
elif [ -e ./ISODIR/sources/winpe.jpg ]; then
  bckimg=winpe.jpg
fi

wimlib-imagex update ISODIR/sources/boot.wim 1 \
  --command "add ISODIR/sources/$bckimg /Windows/system32/winpe.jpg" >/dev/null

wimlib-imagex update ISODIR/sources/boot.wim 1 \
  --command "add ISODIR/sources/$bckimg /Windows/system32/winre.jpg" >/dev/null

wimlib-imagex update ISODIR/sources/boot.wim 1 \
  --command "delete /Windows/System32/winpeshl.ini" >/dev/null

wimlib-imagex export "$tempDir/winre.wim" 1 \
  ISODIR/sources/boot.wim "Microsoft Windows Setup" "Microsoft Windows Setup"

errorHandler $? "Failed to create second index of boot.wim"

wimlib-imagex extract "$firstMetadata" 3 "/Windows/System32/xmllite.dll" \
  --no-acls --dest-dir="ISODIR/sources" >/dev/null

wimlib-imagex info ISODIR/sources/boot.wim 2 --image-property FLAGS=2 >/dev/null
wimlib-imagex info ISODIR/sources/boot.wim 2 --boot >/dev/null

list=
for i in $bootSourcesList; do
    list="$list -oie \"$i\""
done

files=$(find ISODIR -regex ".*/sources/.*" | eval grep $list)
list=

echo "delete /Windows/System32/winpeshl.ini" >"$tempDir/update.txt"
echo "add ISODIR/setup.exe /setup.exe" >>"$tempDir/update.txt"
echo "add ISODIR/sources/inf/setup.cfg /sources/inf/setup.cfg" >>"$tempDir/update.txt"
echo "add ISODIR/sources/$bckimg /sources/background.bmp" >>"$tempDir/update.txt"
echo "add ISODIR/sources/$bckimg /Windows/system32/setup.bmp" >>"$tempDir/update.txt"
echo "add ISODIR/sources/$bckimg /Windows/system32/winpe.jpg" >>"$tempDir/update.txt"
echo "add ISODIR/sources/$bckimg /Windows/system32/winre.jpg" >>"$tempDir/update.txt"
for i in $files; do
    echo "add ISODIR/$i /$i" >>"$tempDir/update.txt"
done

wimlib-imagex update ISODIR/sources/boot.wim 2 <"$tempDir/update.txt" >/dev/null
errorHandler $? "Failed to add required files to second index of boot.wim"

wimlib-imagex optimize ISODIR/sources/boot.wim
rm "ISODIR/sources/xmllite.dll"
if [ -e ./ISODIR/sources/winpe.jpg ]; then
  rm "ISODIR/sources/winpe.jpg"
fi

refglobs=false
for file in `find "$tempDir" -type f -iname "*.esd"`; do
  refglobs=true
done

echo ""
indexesExported=0
for metadata in $metadataFiles; do
  currentInfo=`wimlib-imagex info "$metadata" 3`

  currentEdition=`grep -i "^Edition ID:" <<< "$currentInfo" | sed "s/.*  //g"`
  currentName=`grep -i "^Name:" <<< "$currentInfo" | sed "s/.*  //g"`
  currentType=`grep -i "^Installation Type:" <<< "$currentInfo" | sed "s/.*  //g"`

  if [ "$currentType" == "Server Core" ] && [ "$currentEdition" == "ServerStandard" ]; then
    currentEdition="ServerStandardCore"
  fi
  if [ "$currentType" == "Server Core" ] && [ "$currentEdition" == "ServerDatacenter" ]; then
    currentEdition="ServerDatacenterCore"
  fi

  editionName="Windows 10 $currentEdition"
  if echo $currentName | grep -ow "Windows 11" >/dev/null; then
    editionName="Windows 11 $currentEdition"
  fi
  if echo $currentEdition | grep -i "^Server" >/dev/null; then
    editionName="Windows Server 2022 $currentEdition"
  fi

  echo -e "$infoColor""Exporting $editionName to install.$type...""$resetColor"

  if [ $refglobs == true ]; then
    wimlib-imagex export "$metadata" 3 ISODIR/sources/install.$type \
      "$editionName" $compressParam --ref={"$uupDir","$tempDir"}/*.[eE][sS][dD]
  else
    wimlib-imagex export "$metadata" 3 ISODIR/sources/install.$type \
      "$editionName" $compressParam --ref="$uupDir"/*.[eE][sS][dD]
  fi

  errorHandler $? "Failed to export $editionName to install.$type""$resetColor"

  let indexesExported++

  wimlib-imagex info ISODIR/sources/install.$type $indexesExported \
    --image-property FLAGS="$currentEdition" >/dev/null

  echo ""
  echo -e "$infoColor""Adding winre.wim for $editionName...""$resetColor"
  wimlib-imagex update ISODIR/sources/install.$type $indexesExported \
    --command "add $tempDir/winre.wim /Windows/System32/Recovery/winre.wim"

  echo ""
done

info=`wimlib-imagex info "$firstMetadata" 3`
build=`grep -i "^Build:" <<< "$info" | sed "s/.*  //g"`

addedVirtualEditions=0
if [ $runVirtualEditions -eq 1 ] && [ $build -ge 17063 ]; then
  echo -e "$infoColor""Creating virtual editions...""$resetColor"
  for virtualEdition in $VIRTUAL_EDITIONS_LIST; do
    echo -e "$infoColor""Adding $virtualEdition edition...""$resetColor"
    createVirtualEdition "$virtualEdition"
    error=$?
    if [ $error -ne 1 ]; then
      errorHandler $error "Failed to create virtual edition"
      let addedVirtualEditions++
    fi
    echo ""
  done
elif [ $build -lt 17063 ]; then
  echo "Virtual editions creation requires build 17063 or later"
fi

let indexesSum=$addedVirtualEditions+$indexesExported
spbuild=`grep -i "^Service Pack Build:" <<< "$info" | sed "s/.*  //g"`
arch=`grep -i "^Architecture:" <<< "$info" | sed "s/.*  //g"`

if [ "$arch" == "x86_64" ]; then
  arch="x64"
fi

if [ $indexesSum -gt 1 ]; then
  isoEdition="MULTI"
else
  isoEdition=`grep -i "^Edition ID:" <<< "$info" | sed "s/.*  //g"`
fi

isoLabel=`tr "[:lower:]" "[:upper:]" <<< "${build}.${spbuild}_${arch}_${lang}"`
isoName=`tr "[:lower:]" "[:upper:]" <<< "${build}.${spbuild}_${isoEdition}_${arch}_${lang}.iso"`

if [ -e "$isoName" ]; then
  rm "$isoName"
fi

if [ $addedVirtualEditions -ge 1 ]; then
  echo -e "$infoColor""Optimizing install.$type...""$resetColor"
  wimlib-imagex optimize ISODIR/sources/install.$type
  echo ""
fi

if [ $build -ge 18890 ]; then
  wimlib-imagex extract "$firstMetadata" 3 "/Windows/Boot/Fonts" \
    --no-acls --dest-dir="ISODIR/boot" >/dev/null
  mv -f ISODIR/boot/Fonts/* ISODIR/boot/fonts
  cp ISODIR/boot/fonts/* ISODIR/efi/microsoft/boot/fonts
  rm -r ISODIR/boot/Fonts
fi

echo -e "$infoColor""Creating ISO image...""$resetColor"
find ISODIR -exec touch {} +

# Use mkisofs as fallback to genisoimage
genisoimage="$(command -v genisoimage)"
if [ -z "$genisoimage" ]; then
  genisoimage="$(command -v mkisofs)"
fi

if [ "$arch" == "arm64" ]; then
  "$genisoimage" -b "efi/microsoft/boot/efisys.bin" --no-emul-boot \
    --udf -iso-level 3 --hide "*" -V "$isoLabel" -o "$isoName" ISODIR
else
  "$genisoimage" -b "boot/etfsboot.com" --no-emul-boot \
    --eltorito-alt-boot -b "efi/microsoft/boot/efisys.bin" --no-emul-boot \
    --udf -iso-level 3 --hide "*" -V "$isoLabel" -o "$isoName" ISODIR
fi

errorHandler $? "Failed to create ISO image""$resetColor"

cleanup
echo -e "\033[1;92mDone.""$resetColor"
