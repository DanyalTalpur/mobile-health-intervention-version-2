# MedBridge Telehealth Platform (Monorepo)

Welcome to the **MedBridge** monorepo. This repository contains both the frontend client and the backend REST API.

```
medbridge/
├── backend/                  # FastAPI Python backend (SQLite/PostgreSQL database)
├── frontend/                 # Flutter mobile, web, and desktop client
└── README.md                 # Root documentation (this file)
```

---

## 📱 Frontend (Flutter Client)

MedBridge is a cross-platform Flutter telehealth application that supports both **patient** and **doctor** roles. Features include finding doctors, booking appointments, chat consultations, AI symptom triage, and medical profile management.

### Features
*   **Sign Up & Auth**: Clean 3-step signup, password validation, and JWT authentication.
*   **Role-Based Screens**: Patient Main Screen and Doctor Dashboard.
*   **AI Symptom Chatbot**: Interactive triage questionnaire based on 6 common conditions.
*   **Telehealth Consultation**: Embedded mock calling interface and appointment status tracking.

### Quick Start
To get the frontend client running:
1. Ensure Flutter is installed.
2. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
3. Run the application:
   ```bash
   flutter pub get
   flutter run
   ```

---

## ⚙️ Backend (FastAPI REST API)

A robust telehealth API built with FastAPI. It supports database storage via SQLite (default for development) or PostgreSQL, Alembic migrations, JWT Authentication, and automatic Jitsi video link generation.

### Quick Start
To run the backend server locally:
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Create and activate a Python virtual environment:
   ```bash
   python -m venv venv
   # On Windows:
   .\venv\Scripts\activate
   # On Mac/Linux:
   source venv/bin/activate
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Initialize the database and seed default trees/dummy accounts:
   ```bash
   python init_db.py
   python seed_chief_complaints.py
   python seed_symptom_trees.py
   python seed_dummy_data.py
   ```
5. Start the server:
   ```bash
   uvicorn main:app --reload
   ```

Visit the interactive docs at: http://localhost:8000/docs

---

## 📄 Documentation Map

*   **Monorepo Details**: Read the root [README.md](file:///f:/medbridge/README.md) (this file).
*   **Detailed Backend Manual**: Read [backend/README.md](file:///f:/medbridge/backend/README.md) for full endpoint logs, database setup, troubleshooting, and migrations.
