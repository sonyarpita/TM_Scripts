rm -rf ipv6_rules_cop.txt
for ((i=10; i<=41; i++))
do
j=`expr $i + 1000`
z=`expr $i - 10`
echo "src host $j::157 => offload class $z" >> ipv6_rules_cop.txt
done 
for ((i=50; i<=81; i++))
do
j=`expr $i + 1000`
z=`expr $i - 50`
echo "src host $j::157 => offload class $z" >> ipv6_rules_cop.txt
done


