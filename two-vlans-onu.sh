configure terminal
gpon
onu profile vlan 4000 tag-mode tag cvlan 4000
onu profile vlan 4001 tag-mode tag cvlan 4001
profile tcont DADOS100MB type 4 maximum 102400
!
exit


configure terminal
int gpon_olt-1/2/16
onu 19 type ZTE-F601 sn DB17463E4173
!
interface gpon_onu-1/2/16:19
name cliente-vlan-two
sn-bind enable sn
tcont 4 profile DADOS100MB
gemport 1 tcont 4
!
interface vport-1/2/16.19:1
  service-port 1 user-vlan 4000 vlan 4000
  service-port 2 user-vlan 4001 vlan 4001
!
pon-onu-mng gpon_onu-1/2/16:19
  service 1 gemport 1 vlan 4000
  service 2 gemport 1 vlan 4001
  vlan port eth_0/1 mode hybrid def-vlan 4000
  vlan port eth_0/1 vlan 4000-4001
!
exit
