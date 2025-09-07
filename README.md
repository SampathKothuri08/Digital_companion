# Talk to Aero - AI Educational Assistant 🚀

An intelligent RAG (Retrieval-Augmented Generation) chatbot designed for educational institutions with multi-role access and document processing capabilities.

## ✨ Features

- ** Multi-Role System**: Admin, Student, Teacher, and Parent dashboards
- ** Document Processing**: PDF, video, and YouTube content analysis  
- ** AI-Powered Responses**: Google Gemini 2.0 Flash integration
- ** Smart Search**: Vector embeddings with FAISS for semantic search
- ** User Management**: Role-based authentication and activity tracking
- ** Database**: PostgreSQL with Redis caching for performance
- ** Containerized**: Docker deployment ready

## Quick Start

### Prerequisites
- Python 3.11+
- Docker & Docker Compose
- Git
- Google Gemini API Key (Use your own API key)

### 1. Clone Repository
```bash
git clone https://github.com/SampathKothuri08/Digital_companion.git
cd Digital_companion
```

### 2. Create Virtual Environment
```bash
# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies
```bash
# Install all required packages
pip install -r requirements.txt
```

### 4. Set Up Environment Variables
```bash
# Create .env file with your API key
cat > .env << 'EOF'
# Required API Key (Use your own API key)
GEMINI_API_KEY=your_gemini_api_key_here

# Database Configuration
POSTGRES_PASSWORD=dc_secure_2024
PGADMIN_PASSWORD=admin_secure_2024

# App Configuration
ENVIRONMENT=development
MAX_CONCURRENT_USERS=50
EOF

# Or export directly
export GEMINI_API_KEY="your_gemini_api_key_here"
```


### 5. Start Database Services
```bash
# Start PostgreSQL and Redis using Docker
docker-compose -f docker-compose.prod.yml up postgres redis -d

# Verify services are running
docker-compose -f docker-compose.prod.yml ps
```

### 6. Run the Application
```bash
# Make sure virtual environment is activated
source venv/bin/activate

# Start the Streamlit app
streamlit run DIGITAL_COMPANION_APP.py --server.port=8501
```

### 7. Access the App
Open your browser and go to: **http://localhost:8501**

## 🔑 Default Login Credentials

| Role | Username | Password | Access Level |
|------|----------|----------|--------------|
| **Admin** | `admin` | `admin123` | Full system access, user management, document uploads |
| **Student** | `student1` | `student123` | Chat interface, document queries, learning analytics |
| **Teacher** | `teacher1` | `teacher123` | Student monitoring, content management, analytics |
| **Parent** | `parent1` | `parent123` | Child progress tracking, activity reports |

## 🌐 Access Points

After deployment, access the application at:

- **Main App**: http://localhost:8501
- **Database Admin (pgAdmin)**: http://localhost:8080 
  - Email: `admin@digitalcompanion.com`
  - Password: `admin_secure_2024`
- **Redis Management**: http://localhost:8081

## 📁 Project Structure

```
Talk to Aero/
├── DIGITAL_COMPANION_APP.py    # Main Streamlit application
├── Dockerfile                  # Container configuration
├── docker-compose.prod.yml     # Production deployment
├── requirements.txt            # Python dependencies
├── init.sql                   # Database initialization
├── .env.example              # Environment variables template
├── models/                   # Data models
│   ├── user.py              # User and role definitions
│   └── activity.py          # Activity tracking models
├── services/                # Business logic
│   ├── auth_service.py      # Authentication
│   ├── database_wrapper.py  # Database interface
│   ├── document_service.py  # Document processing
│   ├── rag_service.py       # AI and vector search
│   └── postgresql_service.py # Database operations
├── ui/                      # User interface components
│   ├── auth_page.py         # Login/registration
│   ├── components.py        # Shared UI elements
│   ├── parent_dashboard.py  # Parent interface
│   └── teacher_dashboard.py # Teacher interface
└── uploads/                 # Document storage
```

## 🛠 System Requirements

### Minimum Requirements
- **RAM**: 4GB (8GB recommended)
- **Storage**: 10GB free space
- **CPU**: 2 cores minimum
- **Network**: Internet connection for AI API calls

### Python Dependencies
- **Core**: streamlit, python-dotenv, pyyaml
- **AI**: google-genai, sentence-transformers, faiss-cpu
- **Database**: asyncpg, psycopg2-binary, sqlalchemy, redis
- **Processing**: faster-whisper, moviepy, PyPDF2, yt-dlp
- **Auth**: streamlit-authenticator

## 📋 Step-by-Step Setup Guide

### Complete Installation Guide
```bash
# 1. Clone repository
git clone https://github.com/SampathKothuri08/Digital_companion.git
cd Digital_companion

# 2. Set up Python virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# 3. Upgrade pip and install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# 4. Set your Gemini API key (replace with your own)
export GEMINI_API_KEY="your_gemini_api_key_here"

# 5. Start database services with Docker
docker-compose -f docker-compose.prod.yml up postgres redis -d

# 6. Verify databases are running
docker-compose -f docker-compose.prod.yml ps

# 7. Run the application
streamlit run DIGITAL_COMPANION_APP.py --server.port=8501

# 8. Open browser to http://localhost:8501
```

### Windows Users
```cmd
# Clone repository
git clone https://github.com/SampathKothuri08/Digital_companion.git
cd Digital_companion

# Create virtual environment
python -m venv venv
venv\Scripts\activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Set environment variable (replace with your own API key)
set GEMINI_API_KEY=your_gemini_api_key_here

# Start databases
docker-compose -f docker-compose.prod.yml up postgres redis -d

# Run app
streamlit run DIGITAL_COMPANION_APP.py --server.port=8501
```

## 🔧 Configuration Options

### Environment Variables
- `GEMINI_API_KEY`: Google Gemini API key (required) - Get from [Google AI Studio](https://aistudio.google.com/)
- `POSTGRES_PASSWORD`: Database password (default: dc_secure_2024)
- `ENVIRONMENT`: Set to `development` for local, `production` for servers
- `MAX_CONCURRENT_USERS`: User limit (default: 50 for local, 500 for production)

### Getting Your Gemini API Key
1. Visit [Google AI Studio](https://aistudio.google.com/)
2. Sign in with your Google account
3. Click "Get API key" in the top right
4. Click "Create API key" → "Create API key in new project"
5. Copy the generated key and use it in your .env file

### Database Configuration
- **PostgreSQL**: Port 5433, Database: `digital_companion`
- **Redis**: Port 6379, Used for caching and sessions
- **Data Persistence**: All data stored in Docker volumes

## 🎯 Usage Guide

### For Students
1. Login with student credentials
2. Upload documents or paste YouTube links
3. Ask questions about the content
4. View learning analytics and progress

### For Teachers
1. Monitor student activities and progress
2. Upload course materials and resources
3. View class-wide analytics
4. Manage student accounts

### For Parents
1. Track child's learning activities
2. View progress reports and time spent
3. Monitor engagement with different subjects
4. Receive activity summaries

### For Administrators
1. Manage all user accounts and roles
2. Upload system-wide documents
3. Monitor system performance
4. Configure application settings

## 🐛 Troubleshooting

### Common Issues

**Port Already in Use**
```bash
# Kill processes using port 8501
lsof -ti:8501 | xargs kill -9
```

**Docker Build Fails**
```bash
# Clean Docker system
docker system prune -a
# Rebuild without cache
docker-compose -f docker-compose.prod.yml build --no-cache
```

**Missing Dependencies**
```bash
# Update pip and reinstall
pip install --upgrade pip
pip install -r requirements.txt --force-reinstall
```

**Database Connection Issues**
```bash
# Check if database is running
docker-compose -f docker-compose.prod.yml ps
# View database logs
docker-compose -f docker-compose.prod.yml logs postgres
```

## 🔒 Security Notes

- Change default passwords before production use
- Keep your Gemini API key secure and never commit it
- Use HTTPS in production deployments
- Regularly update dependencies for security patches
- Monitor user activities for suspicious behavior

## 📞 Support

For issues and feature requests:
- **GitHub Issues**: [Report bugs or request features](https://github.com/SampathKothuri08/Digital_companion/issues)
- **Documentation**: Check this README and inline code comments

## 📄 License

This project is open source. Please check the repository for license details.

---

**Built with ❤️ for educational institutions** 🎓