import sys
import os


SITE=os.path.abspath(os.path.dirname(os.path.dirname(__file__)))

if len(sys.argv) < 2 :
  print "python dj-wsgi.py sitename django_project_full_path_name"
  exit

P=sys.argv[2]
S=sys.argv[1]
D=(os.path.dirname(P),os.path.basename(P))

####
WSGI= """import sys
import os
sys.path.append('%s')

os.environ['DJANGO_SETTINGS_MODULE'] = '%s.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
"""
####
APACHE="""
WSGIScriptAlias /%s %s
"""
#
CONF_WSGI= SITE + '/' + S + '/conf/' + D[1] + ".wsgi"
CONF_APACHE= SITE + '/' + S + '/conf/httpd.conf.d/' + D[1] + '.conf'
DJ=(D[1],CONF_WSGI)

# create site/conf/project.wsgi
#
open(CONF_WSGI,"w").write(WSGI%D)

# create site/conf/httpd.conf.d/project.conf
#
open(CONF_APACHE,"w").write(APACHE% DJ )

