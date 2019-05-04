FROM python:3.6-alpine

RUN adduser -D flaskmyferst

WORKDIR /home/flaskmyferst

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

COPY templates templates
COPY main.py boot.sh ./
RUN chmod a+x boot.sh

RUN chown -R flaskmyferst:flaskmyferst ./
USER flaskmyferst

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]