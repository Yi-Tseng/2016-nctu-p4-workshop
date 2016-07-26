#!/usr/bin/python


from scapy.all import sendp
from time import sleep

def main():

    count = 1
    while(1):
        p = "\x00\x00\x00\x01Hello%d" % (count, )
        count += 1
        sendp(p, iface = "eth0")
        sleep(1)

if __name__ == '__main__':
    main()
