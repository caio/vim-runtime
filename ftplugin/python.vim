setlocal complete+=t
setlocal formatoptions-=t

" Allows use of `gf` in python files
python << EOF
import os
import sys
import vim

sst_path = os.path.expanduser('~/src/work/upp/')
sst_paths = [
    os.path.join(sst_path, 'sst/wui'),
    os.path.join(sst_path, 'sst/overlay/ALL/opt/ibm/sst/lib'),
    os.path.join(sst_path, 'common/wui'),
]
for p in sys.path + sst_paths:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# Virtualenv
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))

if os.path.isfile('manage.py'):
    # django project
    from glob import glob
    settings_file = glob('*/settings.py')
    if settings_file:
        mod = settings_file[0].replace('/', '.').replace('.py', '')
        os.environ['DJANGO_SETTINGS_MODULE'] = mod
EOF

