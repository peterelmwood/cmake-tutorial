RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

BUILD_DIR=/cmake/step3_build

echo "setup"
cd /cmake/
[ ! -d $BUILD_DIR ] && mkdir $BUILD_DIR
cd $BUILD_DIR

# set -USE_MYMATH back to default
cmake -U USE_MYMATH .

echo "${RED}**** create executable with custom sqrt ****${NC}"
cmake ../Step2 .
cmake --build .
OUTPUT=$(./Tutorial)
echo -e "${GREEN}${OUTPUT}${NC}"
OUTPUT=$(./Tutorial 100)
echo -e "${RED}${OUTPUT}${NC}"

echo "${RED}**** create executable without custom sqrt ****${NC}"
cmake ../Step2 -DUSE_MYMATH=OFF .
cmake --build .
OUTPUT=$(./Tutorial)
echo -e "${GREEN}${OUTPUT}${NC}"
OUTPUT=$(./Tutorial 100)
echo -e "${RED}${OUTPUT}${NC}"
