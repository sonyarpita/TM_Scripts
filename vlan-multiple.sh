for ((i=10; i<=40; i++))
do
ip link add link enp129s0f4 name enp129s0f4.$i type vlan id $i
ip link set enp129s0f4.$i up
ip addr add 102.$i.$i.77/24 dev enp129s0f4.$i
echo "Configuring VLAN on Port0 of viper1"
ssh viper1 "ip link add link enp4s0f4 name enp4s0f4.$i type vlan id $i"
ssh viper1 "ip link set enp4s0f4.$i up"
ssh viper1 "ip addr add 102.$i.$i.79/24 dev enp4s0f4.$i"
z=`expr $i + 40`
ip link add link enp129s0f4d1 name enp129s0f4d1.$z type vlan id $z
ip link set enp129s0f4d1.$z up
ip addr add 102.$z.$z.77/24 dev enp129s0f4d1.$z
echo "Configuring VLAN on Port1 of viper1"
ssh viper1 "ip link add link enp4s0f4d1 name enp4s0f4d1.$z type vlan id $z"
ssh viper1 "ip link set enp4s0f4d1.$z up"
ssh viper1 "ip addr add 102.$z.$z.79/24 dev enp4s0f4d1.$z"
ping -c2 102.$i.$i.79 & ping -c2 102.$z.$z.79
done
