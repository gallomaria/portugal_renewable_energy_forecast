# image
FROM jupyter/datascience-notebook:latest

# Install system dependencies
USER root
RUN apt-get update && apt-get install -y \
    && apt-get clean

# Copy and install R dependencies
COPY install.R ./install.R
RUN Rscript install.R

# Copy and install Pyhton dependencies
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

# Expose the Jupyter Notebook default port
EXPOSE 8888
                
# Set up the command to run Jupyter Notebook
CMD ["start-notebook.sh"]
