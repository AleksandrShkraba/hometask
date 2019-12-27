import sys
import pip
import os
import pkg_resources
import json
import yaml
import platform
from distutils.sysconfig import get_python_lib

ver = platform.python_version()
env = os.environ['VIRTUAL_ENV'][-11:]
exloc = sys.executable
pip = "".join(pip.__path__)
ppath = os.environ['PYTHONPATH']
packages = []
for i in pkg_resources.working_set:
    packages.append(" Name: " + i.project_name + " Version: " + i.version)
pack = "".join(packages)
packloc = get_python_lib()

rezult = {"Pethon version": ver, "Virtual environment name": env,
          "Python executable location": exloc,
          "Pip Location": pip,
          "PYTHONPATH": ppath, "Packages": pack,
          "Python site-packages location": packloc}

print(rezult)

with open("output.json", 'w') as outfile:
    json.dump(rezult, outfile, indent=3)

with open("output.yml", 'w') as outfile:
    yaml.dump(rezult, outfile)
