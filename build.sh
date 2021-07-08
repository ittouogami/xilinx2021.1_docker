IPADDRESS=$(ip addr show $( netstat -rn | grep UG | awk -F' ' '{print $8}')\
    | grep -o 'inet [0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' \
    | grep -o [0-9].*)
VER=2021.1
docker image build \
    --rm \
    --build-arg IP=${IPADDRESS} \
    --build-arg XILINX_VER=${VER} \
    --build-arg XILINX_MAIN=Xilinx_Unified_2021.1_0610_2318.tar.gz \
    --no-cache \
    -t xilinx${VER} .
