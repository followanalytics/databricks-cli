FROM python:2.7

WORKDIR /usr/src/databricks-cli

COPY . .

RUN pip install --upgrade pip && \
    pip install -r dev-requirements.txt -r tox-requirements.txt && \
    pip list && \
    pip install . && \
    ./lint.sh && \
    pytest tests

ENTRYPOINT [ "databricks" ]
