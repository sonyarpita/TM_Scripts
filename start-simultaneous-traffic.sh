rm -rf Port0 Port1
for ((i=10; i<=40; i++))
do
j=`expr $i - 10`
z=`expr $i + 40`
echo "Traffic on Class $j of Port0" >> Port0
echo "Traffic on Class $j of Port1" >> Port1
echo "===========================================" >> Port0
echo "===========================================" >> Port1
iperf -c 102.$i.$i.79 -P100 -t 120 -p 5002 >> Port0 & iperf -c 102.$z.$z.79 -P100 -t 120 -p5003 >> Port1 
#echo "102.$i.$i.96" & echo "102.$z.$z.96"
echo "===========================================" >> Port0
echo "===========================================" >> Port1
done 

