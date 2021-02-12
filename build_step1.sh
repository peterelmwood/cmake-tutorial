cd /cmake/
[ ! -d "/cmake/step1_build" ] && mkdir step1_build
cd step1_build
cmake ../Step1 .
cmake --build .
./Tutorial
./Tutorial 100