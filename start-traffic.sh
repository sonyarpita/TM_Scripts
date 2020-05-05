rm -rf Port0 Port1
for ((i=10; i<=41; i++))
do
j=`expr $i - 10`
echo "Traffic on Class $j of Port0" >> Port0
echo "===========================================" >> Port0
iperf -c 102.$i.$i.96 -P 2 -t 120 -p 5002 >> Port0 
echo "===========================================" >> Port0

done 

for ((i=50; i<=81; i++))
do
j=`expr $i - 50`
echo "Traffic on Class $j of Port1" >> Port1
echo "===========================================" >> Port1
iperf -c 102.$i.$i.96 -P 2 -t 120 -p 5003 >> Port1
echo "===========================================" >> Port1
done

