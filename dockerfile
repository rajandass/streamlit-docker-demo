FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Add this line to copy the config
COPY .streamlit /app/.streamlit

EXPOSE 8501

# Add baseUrlPath + other flags in CMD (as extra safety)
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.baseUrlPath=app1", "--server.enableCORS=false", "--server.enableXsrfProtection=false"]