# usage: call script with number of step to build:
#   `/cmake/build_step 5 100` # builds step 5 $NUM into /cmake/step5_build dir
#   and runs /cmake/step5_build/Tutorial 5 100,
#   which should yield output `The square root of 100 is 10`.

# exit bash script if no number is provided
if [[ -z "$1" ]] ; then
    echo "Supply an integer corresponding to the step to run"
    exit -1
fi

# set default of 2 to sqrt if value not provided by user
if [[ -z "$2" ]] ; then
    echo "No number supplied to take sqrt of. Using 2."
    INPUT=2
else
    INPUT=$2
fi

STEP=$1

BUILD_DIR=/cmake/step${STEP}_build
STEP_DIR=/cmake/Step${STEP}

[ ! -d $STEP_DIR ] && echo "Step number does not exist" && exit -1

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
CYAN='\033[0;36m'

echo "setup"
cd /cmake/
[ ! -d $BUILD_DIR ] && mkdir $BUILD_DIR
cd $BUILD_DIR

# set -USE_MYMATH back to default
cmake -U USE_MYMATH .

echo -e "${CYAN}**** create executable with custom sqrt ****${NC}"
cmake $STEP_DIR .
cmake --build .
OUTPUT=$(./Tutorial)
echo -e "${GREEN}${OUTPUT}${NC}"
OUTPUT=$(./Tutorial ${INPUT})
echo -e "${RED}${OUTPUT}${NC}"

echo -e "${CYAN}**** create executable without custom sqrt ****${NC}"
cmake $STEP_DIR -DUSE_MYMATH=OFF .
cmake --build .
OUTPUT=$(./Tutorial)
echo -e "${GREEN}${OUTPUT}${NC}"
OUTPUT=$(./Tutorial ${INPUT})
echo -e "${RED}${OUTPUT}${NC}"
