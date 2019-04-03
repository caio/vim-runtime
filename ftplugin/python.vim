setlocal tw=4 ts=4
setlocal complete+=t
setlocal formatoptions-=t

" Allows use of `gf` in python files
python << EOF
import os
import sys
import vim

from glob import glob

def clean_for_path(text):
    return text.replace(" ", r"\ ")


for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % clean_for_path(p))

# Virtualenv
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']

    venv_libs = glob(os.path.join(project_base_dir, 'lib/*/site-packages'))
    if len(venv_libs) == 1 and os.path.isdir(venv_libs[0]):
        vim.command(r"set path+=%s" % clean_for_path(venv_libs[0]))

EOF

