FROM amazonlinux:2023

WORKDIR /app

# Install Python and basic dependencies
RUN dnf update -y && \
    dnf install -y python3 python3-pip gcc curl && \
    dnf clean all

# Copy and install Python requirements
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 8501

CMD ["python3", "-m", "streamlit", "run", "DIGITAL_COMPANION_APP.py", "--server.port=8501", "--server.address=0.0.0.0"]