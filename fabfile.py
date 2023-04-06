#!/user/bin/python3
"""Creating a tar archive using fab
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    """Creating the archive
    """
    cn = Connection()
    stamp = datetime.now().strftime("%Y%m%d%H%M%S")
    try:
        cn.local("mkdir -p versions")
        cn.local("tar -cvzf versions/web_static_{}.tgz webstatic".formart(stamp))
        return "versions/web_static_{}.tgz".format(stamp)
    except Exception as e:
        return None
