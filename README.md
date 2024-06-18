# FU Berlin - Image Processing SoSe 22

The assignments will be published to this repository.
All assignments will be Jupyter Notebooks. That you have to complete.

## Work flow

The rough workflow is:
1. You clone this repository.
2. Edit the exercises.
3. Push it to your **private** repository. Do **not** clean the notebook's output.
4. I fetch your code when the assignment is due. (Every Thursday at 12:00 pm)
5. You fetch the latest assignments from this repository.

It is required to use private git repositories.
The university offers free private repositories [here](https://git.imp.fu-berlin.de/)
or you can get [GitHub repositories for free](https://education.github.com/) as a student.

First clone this repository:

```
$ git clone --origin upstream https://github.com/BildverarbeitungSoSe22/Hausaufgaben
```

Get into the new folder

```
$ cd Hausaufgaben
```

Add your remote

```
$ git remote add origin <your git repo url>
```

To get the latest assignments into your repository see [how to sync a fork](https://help.github.com/articles/syncing-a-fork/).

Paste a link to your repository into the MyCampus assignment box.
Make sure that we have read rights on your repository.

Please give us read access to your repository. Add `sundermann` and `goehring` on Github
or `ssundermann` as well as `drgoehring` on FU GitLab.

Now choose either the Docker container or PyCharm to set up your environment

## Docker (MacOS, Linux, (Windows))

There exists a script for a [docker](https://www.docker.com/) image.
All the libraries we will use are included in this image.
It is recommended to use the image, but you are free to setup the environment
for yourself.

First [install docker](https://docs.docker.com/engine/installation/) on your computer.

Build the image:

```
$ ./docker_build.sh
```

The build script will create a user with your username and uid inside the image.
It may take some minutes until the image is built.

If you don't have a bash you can manually edit the `Dockerfile.sample`.
See the docker documentation for [details](https://docs.docker.com/)

To run the image:

```
$ ./docker_start.sh
```

Now visit [localhost:8888](http://localhost:8888). Jupyter Notebook
should be ready to use.

## PyCharm (MacOS, Linux, Windows)
Open the repository in PyCharm. Wait for indexing to complete and open up any assignment notebook file. 
PyCharm will now complain because no interpreter is configured. In the warning press `Add interpreter` and choose Python 3 inside a virtual environment.

Once again, wait for PyCharm to set up your environment and indexing. Open up the terminal inside PyCharm (it is important to open up the terminal after PyCharm created your virtual environment, if unsure open a new terminal tab) inside PyCharm and install the dependencies: 

```
pip3 install --upgrade -r requirements.txt
```

Start jupyter lab:
````
jupyter lab
````

Now visit [localhost:8888](http://localhost:8888). Jupyter Notebook
should be ready to use.
