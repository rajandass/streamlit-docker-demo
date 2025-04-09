FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# ✅ Inject Streamlit config for baseUrlPath
RUN mkdir -p /app/.streamlit && \
    echo "\
[server]\n\
port = 8501\n\
enableCORS = false\n\
enableXsrfProtection = false\n\
headless = true\n\
baseUrlPath = \"app1\"\n\
" > /app/.streamlit/config.toml

EXPOSE 8501

# ✅ Pass --server.baseUrlPath to CMD to override or align with config.toml
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0", "--server.baseUrlPath=app1"]
