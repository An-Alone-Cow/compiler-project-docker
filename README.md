# How To Run
Use the following command to run the project (requires docker and docker-compose):

```docker-compose run cool```

Use `Docker exec` to enter the container created by the command above. Inside you have access to coolc, spim and other cool related binaries.

You can use `coolc filename.cl` to compile your cool program to spim; afterwards can use `spim filename.s` to run the generated spim file.

# Where To Start
`student-dist/assignments` conatins ready templates for you to start each assignment. `student-dist` is mounted onto `/cool` in the container. You can find the templates folder under the path `/cool/assignments/` inside the container.

