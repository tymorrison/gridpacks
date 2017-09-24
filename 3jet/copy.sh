#!/bin/bash

default=$(basename $(pwd))

for m in 500 600 700 800 900 1000 1200 1400 1600 1800 2000 2500 3000
do
	for perc in 50 60 70 80 90
	do
    		echo Copying mass M$m percentage $perc
    		newdir=../"$default"_M"$m"_perc"$perc"
    		mkdir $newdir
		cp "$default"_proc_card.dat $newdir/"$default"_M"$m"_perc"$perc"_proc_card.dat
    		cp "$default"_run_card.dat $newdir/"$default"_M"$m"_perc"$perc"_run_card.dat
		cp "$default"_customizecards.dat $newdir/"$default"_M"$m"_perc"$perc"_customizecards.dat
    		# modify output name
    		sed -i 's/'$default'/'$default'_M'$m'_perc'$perc'/g' $newdir/"$default"_M"$m"_perc"$perc"_proc_card.dat
    		sed -i 's/'$default'_M'$m'_perc'$perc'_UFO/'$default'_UFO/g' $newdir/"$default"_M"$m"_perc"$perc"_proc_card.dat
		# Modify mass parameter
    		sed -i 's/AMASS/'$m'.0/g' $newdir/"$default"_M"$m"_perc"$perc"_customizecards.dat
		let "secondmass = $perc*$m/100"
		sed -i 's/BMASS/'$secondmass'.0/g' $newdir/"$default"_M"$m"_perc"$perc"_customizecards.dat
	done
done

