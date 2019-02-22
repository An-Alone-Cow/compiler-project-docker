# compiler-project
Mojtahedi's docker-ready project. I'll try to add my own answers for the assignments as well.

# To Run
Use following command to run the project(you need to have docker and docker-compose installed):

```docker-compose run cool```

After that, inside the container you can use `coolc filename.cl` to compile file to spim and `spim filename.s` to run it :).

# Where to Put My Codes On?
Put your codes in the `codes` directory which is mounted on `/codes` directory in the container and by default is the working directory of the container.
