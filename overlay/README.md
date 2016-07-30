Demo code for P4 workshop - Overlay
====

##Demo Target:

 - Custom protocol for overlay network
 - Header modification

##Topology:

```
h1 0 - 0 s1 2 - 0 s2 2 - 0 h2
         1         1
         |         |
         1         1
h3 0 - 0 s3 2 - 0 s4 2 - 0 h4
```

## Slide:

http://www.slideshare.net/YiTseng/2016-nctu-p4-workshop

## Requirements:

- [P4 BMV2](https://github.com/p4lang/behavioral-model)
- [P4 BMV2 configuration generator](https://github.com/p4lang/p4c-bm)
- [Scapy](http://www.secdev.org/projects/scapy/)

## Setup:

- Install requirements
- Setup your bmv2 and p4c-bmv path in env.sh
- Generate json configuration for P4 switch_path

```bash
$ ./compile_bmv2.sh
```

- Install scapy

```bash
$ sudo apt-get install python-scapy python-pyx python-gnuplot
```

- Install networkx

```bash
$ sudo pip install networkx
```

## How to use:

- Start mininet topology

```bash
$ sudo ./topology.py
```

- Add entries to switch

```bash
$ ./send_cmd.sh
```

- Start ./sender.py from h1 (xterm)

```
# h1 ./sender.py
```

- Start ./receiver.py from h2, h3 and h4 (xterm)

```
# ./receiver.py
```

- The result shows on the screen.

![result](https://raw.githubusercontent.com/TakeshiTseng/2016-nctu-p4-workshop/master/overlay/screenshot/result.png)

