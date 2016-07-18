#!/usr/bin/env python
import sys
import struct
from scapy.all import sniff
to_hex = lambda x:"".join([hex(ord(c))[2:].zfill(2) for c in x])

def handle_pkt(pkt):
    pkt = str(pkt)
    raw_hex = to_hex(pkt)
    print "Received %d bytes" % (len(pkt), )
    print "Hex data: %s" % (raw_hex, )
    src, dst, data = struct.unpack("!2B2Bs", pkt)
    sys.stdout.flush()

def main():
    sniff(iface = "eth0", prn = lambda x: handle_pkt(x))

if __name__ == '__main__':
    main()
