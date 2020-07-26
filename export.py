import os
import errno

dotfiles_dir = os.path.join(os.environ['HOME'], 'dotfiles')
EXCLUDE_FILES = [
    __file__,
    'README.md'
]

for filename in [f for f in os.listdir(dotfiles_dir) if f not in EXCLUDE_FILES]:
    dotfile_versioning = os.path.join(dotfiles_dir, filename)
    dotfile_inuse = os.path.join(os.environ['HOME'], filename)
    try:
        os.symlink(
            dotfile_versioning,
            dotfile_inuse
        )
    except Exception as e:
        if e.errno == errno.EEXIST:
            os.unlink(dotfile_inuse)
            os.symlink(
                dotfile_versioning,
                dotfile_inuse
            )
        else:
            raise e

