Snaphot application
This python application makes snapshot of the system:

    CPU load percent
    Disk load percent
    RAM load percent
    Network information
    IO information

!!!IMPORTANT!!!:

    Choose the output type in config.py. Only json and txt can be chosen. Default is txt/
    Application was developed on Windows OS and disk path for load is "C:\". If you use Linux OS please change path in snapshot.py
    You can change period of snapshots in config.py. Default is 5 sec.
    Before using this application please install psutil with pip.

Installation

This version is working stable with python 3.6.9
Clone the repo and navigate to this folder.

$ pip install .
$ python
$ import snapshot

Output file will appear in the same folder which has been cloned previously
