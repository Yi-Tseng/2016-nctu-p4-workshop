#!/usr/bin/env python
import sys
import struct
from scapy.all import sniff
to_hex = lambda x:" ".join([hex(ord(c)) for c in x])

def handle_pkt(pkt):
    pkt = str(pkt)
    if(len(pkt) > 20): return  # filter unexpect packet
    raw_hex = to_hex(pkt)
    print "Received %d bytes" % (len(pkt), )
    print "Hex data: %s" % (raw_hex, )
    src = to_hex(pkt[0:2])
    dst = to_hex(pkt[2:4])
    msg = pkt[4:]
    print "Src %s, Dst %s, Msg: %s" % (src, dst, msg)
    sys.stdout.flush()

def main():
    sniff(iface = "eth0", prn = lambda x: handle_pkt(x))

if __name__ == '__main__':
    main()
