ifconfig enp129s0f4 mtu 9000
ifconfig enp129s0f4d1 mtu 9000
ssh viper1 "ifconfig enp4s0f4 mtu 9000"
ssh viper1 "ifconfig enp4s0f4d1 mtu 9000"

for ((i=10; i<=40; i++))
do
ifconfig enp129s0f4.$i mtu 9000
ssh viper1 "ifconfig enp4s0f4.$i mtu 9000"
z=`expr $i + 40`
ifconfig enp129s0f4d1.$z mtu 9000
ssh viper1 "ifconfig enp4s0f4d1.$z mtu 9000"
done
