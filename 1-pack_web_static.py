#!/usr/bin/python3
"""Creating a tar archive using fab
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    """Creating the archive
    """
    stamp = datetime.now().strftime("%Y%m%d%H%M%S")
    try:
        local("mkdir -p versions")
        local("tar -cvzf versions/web_static_{}.tgz web_static/".format(stamp))
        return "versions/web_static_{}.tgz".format(stamp)
    except Exception as e:
        return None
