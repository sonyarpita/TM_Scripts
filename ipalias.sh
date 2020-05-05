for ((i=10; i<=41; i++))
do
ifconfig enp129s0f4:$i 102.$i.$i.21/24
done

for ((i=50; i<=81; i++))
do
ifconfig enp129s0f4d1:$i 102.$i.$i.21/24
done

