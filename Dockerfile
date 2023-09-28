FROM python:3.11
EXPOSE 7860
WORKDIR .
COPY requirements.txt .
COPY aicovergen/ .
RUN pip install -U pip
RUN python3 -m pip install requests
RUN python3 src/download_models.py
RUN python3 -m pip install --no-cache-dir -r requirements.txt
CMD ["python", "src/webui.py"]