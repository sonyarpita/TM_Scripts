
for ((i=10; i<=41; i++))
do
j=`expr $i + 1000`
ping6 -c2 $j::158
done

for ((i=50; i<=81; i++))
do
j=`expr $i + 1000`
ping6 -c2 $j::158
done


