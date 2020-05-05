myarr=$(ps -ef  | grep -i iperf | awk '{print $2}')
for i in "${myarr[@]}"
do
kill -9 $i
done
ps -ef | grep -i iperf

