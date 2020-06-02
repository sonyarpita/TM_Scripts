rm -rf Port0 Port1
for ((i=10; i<=40; i++))
do
j=`expr $i + 1000`
z=`expr $i + 1040`
echo "Traffic on Class $j of Port0" >> Port0
echo "Traffic on Class $z of Port1" >> Port1
echo "===========================================" >> Port0
echo "===========================================" >> Port1
iperf -V -c $j::79 -P100 -t 120 -p 5002 >> Port0 & iperf -V -c $z::79 -P100 -t 120 -p5003 >> Port1
echo "===========================================" >> Port0
echo "===========================================" >> Port1
done 

