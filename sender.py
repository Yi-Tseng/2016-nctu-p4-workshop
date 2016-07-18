#!/usr/bin/python


from scapy.all import sendp
from time import sleep

def main():

    while(1):
        p = "\x01Hello"
        sendp(p, iface = "h1-eth0")
        sleep(1)

if __name__ == '__main__':
    main()
