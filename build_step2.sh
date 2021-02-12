RED='\033[0;31m'
NC='\033[0m' # No Color

echo "setup"
cd /cmake/
[ ! -d "/cmake/step1_build" ] && mkdir step2_build
cd step2_build

# set -USE_MYMATH back to default
cmake -U USE_MYMATH .

echo "${RED}**** create executable with custom sqrt ****${NC}"
cmake ../Step2 .
cmake --build .
OUTPUT=$({./Tutorial)
echo -e "${RED}${OUTPUT}${NC}"
OUTPUT=$(./Tutorial 100)
echo -e "${RED}${OUTPUT}${NC}"

echo "${RED}**** create executable without custom sqrt ****${NC}"
cmake ../Step2 -DUSE_MYMATH=OFF .
cmake --build .
OUTPUT=$({./Tutorial)
echo -e "${RED}${OUTPUT}${NC}"
OUTPUT=$(./Tutorial 100)
echo -e "${RED}${OUTPUT}${NC}"
