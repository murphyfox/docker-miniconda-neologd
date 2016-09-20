FROM yamitzky/miniconda-neologd:miniconda

# derived: https://github.com/docker-library/python
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY conda-requirements.txt /usr/src/app/
ONBUILD RUN conda install -y --file conda-requirements.txt

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY . /usr/src/app
