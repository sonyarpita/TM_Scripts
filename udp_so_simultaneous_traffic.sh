ssh viper1 "killall netserver"
ssh viper1 "cd netperf-chelsio/src/ && ./netserver -4 -p12000 && ./netserver -4 -p13000"

rm -rf Port0 Port1
iter=0
while :
do
	iter=`expr $iter + 1` 
	echo "Iteration $iter" >> Port0
	echo "Iteration $iter" >> Port1
	for ((i=0; i<=30; i++))
	do
		echo "Traffic on Class $i of Port0" >> Port0
		echo "Traffic on Class $i of Port1" >> Port1
		echo "===========================================" >> Port0
		echo "===========================================" >> Port1
		for ((j=1; j<=250; j++))
		do
			./netperf -H 102.1.1.79 -t UDP_STREAM -l30 -p12000 -e$i -g1316 -u -- -m13160 >> Port0 & ./netperf -H 102.2.2.79 -t UDP_STREAM -l30 -p13000 -e$i -g1316 -u -- -m13160 >> Port1 &
		done
		sleep 40
		echo "===========================================" >> Port0
		echo "===========================================" >> Port1
	done
done 

