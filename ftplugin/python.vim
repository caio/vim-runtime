setlocal tw=4 ts=4
setlocal complete+=t
setlocal formatoptions-=t

" Allows use of `gf` in python files
python << EOF
import os
import sys
import vim

from glob import glob


for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# Virtualenv
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']

    if 'PIPENV_ACTIVE' in os.environ:
        venv_libs = glob(os.path.join(project_base_dir, 'lib/*/site-packages'))
        if len(venv_libs) == 1 and os.path.isdir(venv_libs[0]):
            vim.command(r"set path+=%s" % venv_libs[0].replace(" ", r"\ "))
    else:
        sys.path.insert(0, project_base_dir)
        activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
        if os.path.exists(activate_this):
            execfile(activate_this, dict(__file__=activate_this))

if os.path.isfile('manage.py'):
    # django project
    settings_file = glob('*/settings.py')
    if settings_file:
        mod = settings_file[0].replace('/', '.').replace('.py', '')
        os.environ['DJANGO_SETTINGS_MODULE'] = mod
EOF

