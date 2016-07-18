#!/usr/bin/env python
from scapy.all import sniff



def handle_pkt(pkt):
    pkt = str(pkt)
    print pkt

def main():
    sniff(iface = "h2-eth0", prn = lambda x: handle_pkt(x))

if __name__ == '__main__':
main()
