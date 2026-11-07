#!/bin/bash
# Verificación desde Kali: IP por DHCP, conectividad y SNMP de R1 y SW1.
# Uso: bash kali_dhcp_snmp_check.sh

COMUNIDAD="PUBLIC_LAB"
R1="10.8.46.129"
SW1="10.8.46.200"

echo "== IP de eth1 (DHCP) =="
ip addr show eth1 | grep "inet "

echo "== Ping a R1 (gateway) =="
ping -c 3 $R1

echo "== Ping a SW1 =="
ping -c 3 $SW1

echo "== SNMP R1 (sysName) =="
snmpwalk -v2c -c $COMUNIDAD $R1 1.3.6.1.2.1.1.5.0

echo "== SNMP SW1 (sysName) =="
snmpwalk -v2c -c $COMUNIDAD $SW1 1.3.6.1.2.1.1.5.0