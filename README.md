# cromai-bash-python-test

The objective of this test is to develop a simple software for the **Processo Seletivo Cromai | Case Time de Embarcados 2021**

It's possible to see the project rules and details in the following [PDF](https://github.com/julioclopes32/cromai-bash-python-test/blob/main/CROMAI_Case%20Embarcados%202021.pdf).

What is expected in this case:

- I - Write a concept model code from the bash code and python code, for exemple a diagram or a pseudo-code.
- II - Write the shell script code.
- III - Write the code in python3.
- IV - Do the integration between the 2 codes.
- V - Discribe the differences between the concept model and what was implemented.
- VI - (EXTRA) Create a cromai.log file to store software errors
- VII - (EXTRA) Create a dockerfile with all dependencies

### I - Concept model

The first step into solving a problem is to understand it. What is the possible solution? How to structure it? Which techniques are going to be used ? As well as be careful to not overengineer the solution giving more complexity than is actually necessary.

The more complex the problem, the harder is to connect all the ideas and structure the brainstorm into clear and defined steps.

A good way to do that is creating a concept model, in this case I created two, since we're integrating 2 scripts, each one with it's own life cycle.

It's possible to see it, in the following image: 

<img src='./diagram.png'>
<center>Figure 1. At the left we can see the bash script model, at the right the python3 code model.</center>
<br>

### II - Shell script code
The shell script code as required was developed to run in linux OS, the OS used to develop this code it was Ubuntu.

### III - Python3 script code
The python3 script code was developed using the python version 3.8.10

It wasn't necessary to import external libraries, only the native python libraries time **(to manage time waiting)** as well as OS **(to manage the PID tasks)**.

### IV - Do the integration between the 2 codes.

As required the bash script code is responsable to run the python code and check if it's currently running in the system.

It is important to notice that if not required the bash script will run synchronously, that means when running the python3 code, the bash script will pause and wait for it to finish before continue the loop, to prevent that we used the following code:

```
 python3 python_script.py &
```
the letter ```&``` at the end of the command ensures that both scripts run independent from each other so the bash script can check if the python code is alive while it's running. The same technique can be used to run multiple scripts independently from each other.

### V - Differences between the concept model and implementation.

The given problem required a simple solution, and it had a set of well defined rules, but during the development, the focus was in reach the basic solution, that means solve the core problem from topics **I to VI** and leave it for later the extra points.

Because of that I can say that the model lacks of discribing the extra features which were, add the dockerfile with the project depencies as well as the log.

As discribed in the project rules, it wasn't necessary to fix the concept model, so, I left the model in it's first version.

### VI - (EXTRA) Create a cromai.log file to store software errors

During software development is important to handle exceptions.

In python this is simply implemented using the Try/Catch functions, but bash unfortunately doesn't have as many luxuries as one can find in many programming languages.

There is no try/catch in bash, to handle errors we must use other techniques.

In this case I used the following code at the beggining of the script:

```
#Defining log file.
log=cromai.log

# create log file or overrite if already present
printf "Log File - " > $log

err_report() {
    date >> $log
    echo "bash_script.sh: Error on line $1" >> $log
}

#With function trap we create a signal that runs the function err_report when the ERR event occurs.
trap 'err_report $LINENO' ERR
```
with the function ```trap``` the bash script creates an event based signal, that runs an specific function, in this case the function  ```err_report()``` that writes in the log file the specific line of the error.

### VII - (EXTRA) Create a dockerfile with all dependencies

The docker technology uses the concept of containers to export not only necessary required libraries to other envirements as well export the OS used to run the application.

To avoid using a bunch of unecessary libraries and OS python requirements, we used Venv, that allows us to use a particion of python with it's own necessary libraries creating a clean envirement to operate.

In our case, how we only used the native python libraries **time** and **OS** because of that the ```requirements.txt``` became empty.