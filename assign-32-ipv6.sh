
for ((i=10; i<=41; i++))
do
j=`expr $i + 1000`
ip -6 addr add $j::77/64 dev enp129s0f4
ssh viper1 "ip -6 addr add $j::79/64 dev enp4s0f4"
done

for ((i=50; i<=81; i++))
do
j=`expr $i + 1000`
ip -6 addr add $j::77/64 dev enp129s0f4d1
ssh viper1 "ip -6 addr add $j::79/64 dev enp4s0f4d1"
done

for ((i=10; i<=41; i++))
do
	j=`expr $i + 1000`
	ping6 -c2 $j::79
	z=`expr $i + 1040`
	ping6 -c2 $z::79
done


