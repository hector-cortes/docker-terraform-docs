FROM python:3.6-slim
LABEL maintainer="Hector Cortes"

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    make \
  && apt-get autoremove \
  && apt-get clean 

RUN python3 -m pip install --no-cache-dir -U pip 
RUN python3 -m pip install --no-cache-dir Sphinx==3.2.1
RUN python3 -m pip install --no-cache-dir sphinxcontrib-confluencebuilder==1.2.0

WORKDIR /docs
CMD ["sphinx-build -b confluence ./docs/input_files ./docs/output_files"]