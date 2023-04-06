#!/usr/bin/python3
"""Deploying the webstatic to the server
"""
from fabric import Connection
import os

hosts = ["ubuntu@54.152.198.15", "ubuntu@54.234.1.228"]


def do_deploy(archive_path):

    connects = []
    for host in hosts:
        connects.append(Connection(host))

    if not os.path.isfile(archive_path):
        return False

    file_path = archive_path.split("/")[-1]
    dir_name = file_path.split(".")[0]

    dir_path = "/data/web_static/releases/{}".format(dir_name)
    try:
        for c in connects:
            c.put(archive_path, "/tmp/")
            c.run("mkdir -p {}".format(dir_name))
            c.run("tar -xvzf tmp/{}.tgz -C {}".format(file_path, dir_path))
            c.run("rm /tmp/{}".format(file_path))
            c.run("sudo ln -sf {} /data/web_static/current".format(dir_path))
    except Exception as e:
        return False
    return True
