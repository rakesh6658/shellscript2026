#!/bin/bash

Start_Time=$(date +%s)

echo "Script started execution at:: $Start_Time"

sleep 10

End_Time=$(date +%s)

echo "Script stopped execution at:: $End_Time"

Total_Time=$(($End_Time-$Start_Time))

echo "Total time taken:: $Total_Time seconds"
