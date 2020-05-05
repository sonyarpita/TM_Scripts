rm -rf old-Port0 old-Port1
mv Port0 old-Port0
mv Port1 old-Port1
#rm -rf Port0 Port1
for ((i=10; i<=25; i++))
do
j=`expr $i + 20`
iperf -c 102.$i.$i.96 -P 100  >> Port0 & iperf -c 102.$j.$j.96 -P 100  >> Port1



done


