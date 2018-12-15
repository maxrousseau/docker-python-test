# python3 conda runtime
# FROM heroku/miniconda
FROM continuumio/miniconda3

# set working directory to /app
WORKDIR /app

# add the current directory contents into the container at app
ADD . /app

# install the packages that I need through conda
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN conda install opencv
RUN conda install numpy
RUN conda install scikit-learn

# make port 80 available to the world outside this container
EXPOSE 80

# define environment variable
ENV NAME World

# run my app when the container lauches
CMD ["python", "cli.py"]
