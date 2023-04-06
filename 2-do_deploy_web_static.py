#!/usr/bin/python3
"""Deploying the webstatic to the server
"""
from fabric.api import env, put, run
import os

env.hosts = ["54.152.198.15", "54.234.1.228"]


def do_deploy(archive_path):

    if not os.path.isfile(archive_path):
        return False

    file_path = archive_path.split("/")[-1]
    dir_name = file_path.split(".")[0]

    dir_path = "/data/web_static/releases/{}".format(dir_name)
    try:
        put(archive_path, "/tmp/")
        run("sudo mkdir -p {}".format(dir_path))
        run("sudo tar -xvzf /tmp/{} -C {}".format(file_path, dir_path))
        run("sudo rm /tmp/{}".format(file_path))
        run("sudo ln -sf {} /data/web_static/current".format(dir_path))
    except Exception as e:
        return False
    return True
