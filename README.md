# Talk to Aero - Educational RAG Chatbot

A scalable RAG (Retrieval-Augmented Generation) chatbot system designed for educational institutions with 500+ concurrent users.

##  Features

- **Multi-Role System**: Admin, Student, Teacher, Parent access levels
- **Scalable Architecture**: PostgreSQL + Redis for high performance
- **Document Management**: Centralized knowledge base with admin controls
- **Activity Monitoring**: Comprehensive student progress tracking
- **Parent Dashboard**: Real-time student learning analytics
- **Response Caching**: Sub-second response times with intelligent caching

##  Architecture

```
├── DIGITAL_COMPANION_APP.py    # Main Streamlit application
├── models/                     # Data models
│   ├── user.py                # User and role definitions
│   └── activity.py            # Activity tracking models
├── services/                  # Business logic layer
│   ├── database_wrapper.py    # PostgreSQL interface
│   ├── postgresql_service.py  # Async database service
│   ├── auth_service.py        # Authentication
│   ├── activity_service.py    # Activity logging
│   ├── document_service.py    # Document management
│   └── rag_service.py         # RAG operations
├── ui/                        # User interface components
│   ├── components.py          # Shared UI components
│   ├── auth_page.py           # Authentication pages
│   └── parent_dashboard.py    # Parent monitoring interface
└── docker-compose.prod.yml    # Production deployment
```

## Database Schema

- **users**: Role-based user management with UUIDs
- **user_relationships**: Parent-child associations  
- **student_activities**: Partitioned activity logs for performance
- **documents**: Centralized knowledge base
- **response_cache**: Query response caching with TTL

##  Setup

1. **Clone and Install**:
   ```bash
   git clone <repository>
   cd DIGITAL_COMPANION
   python -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```

2. **Start Database Services**:
   ```bash
   docker-compose -f docker-compose.prod.yml up postgres redis -d
   ```

3. **Configure Environment**:
   ```bash
   export GEMINI_API_KEY=your-api-key
   export DATABASE_URL=postgresql://dc_user:dc_secure_2024@localhost:5433/digital_companion
   ```

4. **Run Application**:
   ```bash
   streamlit run DIGITAL_COMPANION_APP.py
   ```

## 👥 Default Users

| Role | Username | Password | Capabilities |
|------|----------|----------|--------------|
| Admin | admin | admin123 | Document upload, user management |
| Student | student1 | student123 | Query interface, learning tracking |
| Teacher | teacher1 | teacher123 | Analytics, content management |
| Parent | parent1 | parent123 | Student progress monitoring |

##  Parent-Child Linking

For production deployment with 500+ students, implement one of:

1. **Student ID Codes**: Parents enter student ID during registration
2. **Email Mapping**: Domain-based automatic linking
3. **Bulk Import**: CSV upload with pre-defined relationships
4. **Invitation System**: Pre-created accounts with invitation links

## Performance

- **Concurrent Users**: Designed for 500+ simultaneous users
- **Response Time**: <1 second with caching
- **Database**: Partitioned tables for scalability
- **Caching**: Multi-layer with PostgreSQL + Redis

## 🐳 Production Deployment

### **Secure Production Setup**:

1. **Configure Environment**:
   ```bash
   # Copy the example template (if you don't have .env yet)
   cp .env.example .env
   
   # Edit .env with your actual values:
   # GEMINI_API_KEY=your_actual_api_key
   # POSTGRES_PASSWORD=your_secure_password
   # PGADMIN_PASSWORD=your_admin_password
   ```

2. **Deploy**:
   ```bash
   # Load environment variables
   source .env  # or: export $(cat .env | xargs)
   
   # Start production stack
   docker-compose -f docker-compose.prod.yml up -d
   ```

3. **Access Services**:
   - **App**: http://localhost:8501
   - **pgAdmin** (if enabled): http://localhost:8080
   - **Redis Commander** (if enabled): http://localhost:8081

**Security Note**: For production, consider commenting out pgAdmin and Redis Commander services in `docker-compose.prod.yml` if not needed.

##  Technology Stack

- **Frontend**: Streamlit
- **Backend**: Python + AsyncPG
- **Database**: PostgreSQL 15 with partitioning
- **Cache**: Redis 7
- **AI**: Google Gemini 2.0 Flash
- **Embeddings**: SentenceTransformers
- **Vector Search**: FAISS
- **Deployment**: Docker + Docker Compose

---
**Built for scalable educational AI applications** 🎓