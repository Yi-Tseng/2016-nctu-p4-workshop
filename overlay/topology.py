#!/usr/bin/env python
from mininet.net import Mininet, VERSION
from mininet.log import setLogLevel, info, debug
from mininet.cli import CLI
from distutils.version import StrictVersion
from p4_mininet import P4Switch, P4Host
from time import sleep
import sys


'''
h1 0 - 0 s1 2 - 0 s2 2 - 0 h2
         1         1
         |         |
         1         1
h3 0 - 0 s3 2 - 0 s4 2 - 0 h4
'''

SW_PATH='/home/yi/bmv2/targets/simple_switch/simple_switch'
JSON_PATH='/home/yi/2016-nctu-p4-workshop/overlay/demo.json'


def main():
    net = Mininet(controller = None, autoSetMacs=True, autoStaticArp=True)

    h1 = net.addHost('h1', cls=P4Host)
    h2 = net.addHost('h2', cls=P4Host)
    h3 = net.addHost('h3', cls=P4Host)
    h4 = net.addHost('h4', cls=P4Host)

    s1 = net.addSwitch('s1', cls = P4Switch, sw_path=SW_PATH, json_path=JSON_PATH, thrift_port=9091)
    s2 = net.addSwitch('s2', cls = P4Switch, sw_path=SW_PATH, json_path=JSON_PATH, thrift_port=9092)
    s3 = net.addSwitch('s3', cls = P4Switch, sw_path=SW_PATH, json_path=JSON_PATH, thrift_port=9093)
    s4 = net.addSwitch('s4', cls = P4Switch, sw_path=SW_PATH, json_path=JSON_PATH, thrift_port=9094)

    net.addLink(s1, h1, port1=0, port2=0)
    net.addLink(s1, s3, port1=1, port2=1)
    net.addLink(s1, s2, port1=2, port2=0)

    net.addLink(s2, s4, port1=1, port2=1)
    net.addLink(s2, h2, port1=2, port2=0)

    net.addLink(s3, h3, port1=0, port2=0)
    net.addLink(s3, s4, port1=2, port2=0)

    net.addLink(s4, h4, port1=2, port2=0)


    net.start()
    CLI(net)
    net.stop()

if __name__ == '__main__':
    setLogLevel('debug')
    main()
