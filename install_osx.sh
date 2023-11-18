#!/usr/bin/env bash


source ./scripts/intel.sh
source ./scripts/m1.sh


NC='\033[0m' # No Color
# Regular Colors
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White
# Bold
B_BLACK='\033[1;30m'       # Black
B_RED='\033[1;31m'         # Red
B_GREEN='\033[1;32m'       # Green
B_YELLOW='\033[1;33m'      # Yellow
B_BLUE='\033[1;34m'        # Blue
B_PURPLE='\033[1;35m'      # Purple
B_CYAN='\033[1;36m'        # Cyan
B_WHITE='\033[1;37m'       # White

PROCESSADOR=$( sysctl -n machdep.cpu.brand_string )
CORE_COUNT=$( sysctl -n machdep.cpu.core_count )
THREAD_COUNT=$( sysctl -n machdep.cpu.thread_count )
MEMORY_SIZE=$(( $( sysctl -n hw.memsize ) / 1024 / 1024 / 1024 ))
GPU_CHIP=$( system_profiler SPDisplaysDataType | grep Chipset )

if [[ $(uname -p) == "i386" ]]; then
  # Mac Intel
  echo -e "\n==========================================================\n"
  echo -e "\t\t${PURPLE}Arquitetura Intel${NC}\n"
  echo -e "${B_WHITE}Processador: ${B_GREEN}$PROCESSADOR${NC}"
  echo -e "${B_WHITE}Nucleos: ${B_GREEN}$CORE_COUNT${NC} | ${B_WHITE}Threads: ${B_GREEN}$THREAD_COUNT${NC}"
  echo -e "${B_WHITE}Memoria: ${B_GREEN}$MEMORY_SIZE GB${NC}${B_CYAN}"
  echo -e "${GPU_CHIP}${NC}" | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//'

  echo -e "\n==========================================================\n"

  install_osX_intel

elif [[ $(uname -p) == "m1" ]]; then

  echo -e "\n==========================================================\n"
  echo -e "\t\t${PURPLE}Arquitetura M1${NC}\n"
  echo -e "${B_WHITE}Processador: ${B_GREEN}$PROCESSADOR${NC}"
  echo -e "${B_WHITE}Nucleos: ${B_GREEN}$CORE_COUNT${NC} | ${B_WHITE}Threads: ${B_GREEN}$THREAD_COUNT${NC}"
  echo -e "${B_WHITE}Memoria: ${B_GREEN}$MEMORY_SIZE GB${NC}${B_CYAN}"
  echo -e "${GPU_CHIP}${NC}" | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//'

  echo -e "\n==========================================================\n"

  install_osX_M1

else
  echo "Arquitetura desconhecida"
  echo ${uname -p}
fi
