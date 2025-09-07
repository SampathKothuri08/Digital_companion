FROM amazonlinux:2023

WORKDIR /app

# Install Python 3.11 and system dependencies
RUN dnf update -y \
    && dnf install -y \
        python3.11 \
        python3.11-pip \
        python3.11-devel \
        gcc \
        gcc-c++ \
        curl \
        ffmpeg \
        libSM \
        libXext \
        glib2-devel \
        libX11-devel \
        libXrender-devel \
        fontconfig-devel \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Create symlinks for python and pip
RUN ln -sf /usr/bin/python3.11 /usr/bin/python3 \
    && ln -sf /usr/bin/python3.11 /usr/bin/python \
    && ln -sf /usr/bin/pip3.11 /usr/bin/pip

# Copy requirements first for better caching
COPY requirements.txt .

# Create non-root user for security
RUN groupadd -r appuser && useradd -r -g appuser appuser \
    && mkdir -p /home/appuser/.cache \
    && mkdir -p /app/.streamlit \
    && mkdir -p /app/cache

# Install Python dependencies
RUN python3.11 -m pip install --upgrade pip \
    && python3.11 -m pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set proper permissions
RUN chown -R appuser:appuser /app \
    && chown -R appuser:appuser /home/appuser \
    && chmod 755 /app

USER appuser

# Environment variables
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_BROWSER_GATHER_USAGE_STATS=false

EXPOSE 8501

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD curl --fail http://localhost:8501/_stcore/health || exit 1

CMD ["python3.11", "-m", "streamlit", "run", "DIGITAL_COMPANION_APP.py", "--server.port=8501", "--server.address=0.0.0.0"]