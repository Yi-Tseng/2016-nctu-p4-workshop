Demo code for P4 workshop
====

##Demo Target:

 - Path routing
 - Stateful dataplane

## Slide:

http://www.slideshare.net/YiTseng/2016-nctu-p4-workshop

## Requirements:

- [P4 BMV2](https://github.com/p4lang/behavioral-model)
- [P4 BMV2 configuration generator](https://github.com/p4lang/p4c-bm)
- [Scapy](http://www.secdev.org/projects/scapy/)

## Setup:

- Install requirements
- Setup your bmv2 and p4c-bmv path in env.sh
- Generate json configuration for P4 switch

```bash
$ ./compile_bmv2.sh
```

- Install scapy

```bash
$ sudo apt-get install python-scapy python-pyx python-gnuplot
```
