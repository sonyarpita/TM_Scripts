for ((i=10; i<=40; i++))
do
ip link delete enp129s0f4.$i
echo "Deleting VLAN on Port0 of viper1"
ssh viper1 "ip link delete enp4s0f4.$i"
z=`expr $i + 40`
ip link delete enp129s0f4d1.$z
echo "Deleting VLAN on Port1 of viper1"
ssh viper1 "ip link delete enp4s0f4d1.$z"
done
