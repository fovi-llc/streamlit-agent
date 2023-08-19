# The builder image, used to build the virtual environment
FROM python:3.11-buster 

RUN apt-get update && apt-get install -y git wget curl unzip

# A directory to have app data 
WORKDIR /app

COPY ./requirements.txt /app

RUN pip install -U pip
RUN pip install -r requirements.txt

COPY ./streamlit_agent /app/streamlit_agent

ENV PYTHONPATH=/app

CMD ["streamlit", "run", "streamlit_agent/mrkl_demo.py", "--server.port", "8080"]
