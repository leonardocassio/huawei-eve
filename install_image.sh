#!/bin/sh

# Instalar Imagem Roteador NE40 e Switch CE12800 da Huawei no EVE-NG
#	Autor: Leonardo Silva
#	GIT: https://github.com/leonardocassio/huawei-eve

echo "
########################################################################
#                                                                      #
#   SCRIPT APENAS TESTADO NA VERSÃO EVE COMMUNITY EDITION 2.0.3-112    #
#                                                                      #
########################################################################"

sleep 03 

echo "
#FAZENDO DOWNLOAD DAS IMAGENS"

# Diretorio de Download das Imagens
cd /tmp/
# Baixando Imagens
curl -L -o huawei.zip https://www.dropbox.com/s/9omjbhwfpqf5ga2/Huawei.zip?dl=1

echo "
#DESCOMPACTADO IMAGENS"

# Descompactar .zip
unzip -o huawei.zip -d /tmp/ | awk 'BEGIN {ORS=" "} {print "."}'

echo "
#INSTALANDO IMAGENS"

cd /tmp/Huawei-NE40/
mv huaweine-ne/ /opt/unetlab/addons/qemu/
cp huaweine.yml /opt/unetlab/html/templates/amd/
cp huaweine.yml /opt/unetlab/html/templates/intel/
mv huaweine.yml /opt/unetlab/html/templates_legacy/

echo "
#HUAWEI NE40 - OK"

cd /tmp/Huawei-CE12800/
mv huaweice12800-V200R005C10SPC607B607/ /opt/unetlab/addons/qemu/
cp huaweice12800.yml /opt/unetlab/html/templates/amd/
cp huaweice12800.yml /opt/unetlab/html/templates/intel/
mv huaweice12800.yml /opt/unetlab/html/templates_legacy/
mv ce.png /opt/unetlab/html/images/icons/

echo "
#HUAWEI CE12800 - OK"

echo "
#FIXANDO PERMISSÃO"

/opt/unetlab/wrappers/unl_wrapper -a fixpermissions