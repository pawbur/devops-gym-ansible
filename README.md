Sample usecase:

``vagrant up`` will:
- crate 'build' VM with docker installed
- pull repository ex_0 repository from git
- start Redis container
- build ex_0 image
- start ex_0 container which should then be available at localhost:5000

we can then edit ``./ex_0/ex_0/server.py``
run ``./build.sh build,run`` to rebuild and restart ex_0 container.
