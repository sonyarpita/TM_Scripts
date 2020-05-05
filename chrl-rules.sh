#cxgbtool enp3s0f4 sched-class params type packet level ch-rl rate-unit bits rate-mode absolute channel 0 max-rate 1000000 
#cxgbtool enp3s0f4 sched-class params type packet level ch-rl rate-unit bits rate-mode absolute channel 1 max-rate 2000000 


cxgbtool enp3s0f4 sched-class params type packet level ch-rl rate-unit bits rate-mode relative channel 0 max-rate 10 
cxgbtool enp3s0f4 sched-class params type packet level ch-rl rate-unit bits rate-mode relative channel 1 max-rate 30


