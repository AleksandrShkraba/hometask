#!/usr/bin/env python
import psutil
import time
import threading
import json
from config import interval
from config import data_type


class MyServer:

    def __init__(self):
        file = open('rezult.txt', 'w')
        file.write('System data:\n')
        file.close()

    def o_c_u(self):  # overall cpu usage
        ocu = str(psutil.cpu_percent(interval=interval))
        return ocu

    def o_vm_u(self):  # overall virtual memory usage
        ovmu = str(psutil.virtual_memory().percent)
        return ovmu

    def o_m_u(self):  # overall memory usage
        omu = str(psutil.disk_usage('C:\\').percent)
        return omu

    def io_inf(self):  # io information
        ioi = str(psutil.disk_io_counters().write_time)
        return ioi

    def n_inf(self):  # network information
        n_inf = str(psutil.net_io_counters().packets_sent)
        return n_inf


def for_json(my_dict):
    try:
        data = json.load(open('rezult.json'))
    except IndexError:
        data = []
    data.append(my_dict)
    with open('rezult.json', 'w') as file:
        json.dump(data, file, indent=2)


def make_rez():
    threading.Timer(interval, make_rez)
    my_server = MyServer()
    from itertools import count
    for i in count(1):
        if data_type == 'txt':
            s = "SNAPSHOT " + str(i) + ": " + "TIME STAMP: " + str(
                time.ctime()) + " CPU:" + my_server.o_c_u() + "%" + " MEMORY: " \
                + my_server.o_m_u() + "% VIRTUAL_MEMORY: " + my_server.o_vm_u() + \
                "% IO_info: " + my_server.io_inf() + " NET_info: " + my_server.n_inf() + '\n'
            rezult_file = open('rezult.txt', 'a')
            rezult_file.write(s)
            rezult_file.close()
        elif data_type == 'json':
            rez_data = {
                'SNAPSHOT': str(i), 'Time STAMP': str(time.ctime()),
                'CPU': my_server.o_c_u(),
                'MEMORY': my_server.o_m_u(),
                'VIRTUAL_MEMORY': my_server.o_vm_u(),
                'IO_info': my_server.io_inf(),
                'NET_info': my_server.n_inf()
            }
            for_json(rez_data)


make_rez()
