# HAL Koraput Inventory Management System (IMS)

A Flask-based web application to manage inventory items, suppliers, purchase orders, consumption logs, and user accounts for Hindustan Aeronautics Ltd. — Koraput Division.

---

## 📋 Table of Contents

1. [Features](#-features)  
2. [Tech Stack](#-tech-stack)  
3. [Getting Started](#-getting-started)  
   - [Prerequisites](#prerequisites)  
   - [Installation](#installation)  
   - [Database Setup](#database-setup)  
   - [Running the App](#running-the-app)  
4. [⚙️ Configuration](#-configuration)  
5. [📂 Project Structure](#-project-structure)  
6. [📖 Usage](#-usage)  
7. [🤝 Contributing](#-contributing)  
8. [📝 License](#-license)

---

## 🚀 Features

- **User Management**  
  - Role-based access (admin, manager, staff)  
  - Email verification and account activation/deactivation  
- **Supplier Management**  
  - Create, read, update, delete suppliers  
- **Inventory Items**  
  - Manage items with categories, units of measure, stock levels, reorder thresholds  
  - Full CRUD operations  
- **Purchase Orders**  
  - Create orders and add line items  
  - Approval, rejection, and closure workflows  
- **Consumption Logs**  
  - Record actual vs. expected usage of items  
- **Responsive UI**  
  - Built with Bootstrap 5 (Lux theme) and Font Awesome  
  - Light/Dark mode toggle  
- **Authentication & Security**  
  - Session management via Flask-Login  
  - Role-based access control  
- **Database ORM**  
  - SQLAlchemy models with MySQL backend  
- **Migrations**  
  - Database migrations with Flask-Migrate

---

## 🛠 Tech Stack

- **Backend**: Python 3.8+, Flask, Flask-Login, Flask-Migrate  
- **Database**: MySQL (via Flask-SQLAlchemy)  
- **Frontend**: Bootstrap 5, Font Awesome, Jinja2 templates

---

## 📦 Getting Started

### Prerequisites

- Python 3.8 or newer  
- MySQL server installed and running  
- Git  

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/hal-koraput-ims.git
   cd hal-koraput-ims
   ```
2. **Create & activate a virtual environment**
   ```bash
   python3 -m venv venv
   # on Linux/macOS
   source venv/bin/activate
   # on Windows
   venv\Scripts\activate
   ```
3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

### Database Setup

1. **Create the MySQL database**
   ```sql
   CREATE DATABASE hal_inventory
     CHARACTER SET utf8mb4
     COLLATE utf8mb4_unicode_ci;
   ```
2. **Configure the connection**
   - Edit `config.py` or set the environment variable:
     ```python
     SQLALCHEMY_DATABASE_URI = "mysql+pymysql://user:password@localhost/hal_inventory"
     ```
3. **Run migrations**
   ```bash
   flask db upgrade
   ```

### Running the App

1. **Set the Flask entry point**
   - On Linux/macOS:
     ```bash
     export FLASK_APP=run.py
     ```
   - On Windows:
     ```bash
     set FLASK_APP=run.py
     ```
2. **Start the development server**
   ```bash
   flask run
   ```
3. **Access**
   - Open http://127.0.0.1:5000 in your web browser.

---

## ⚙️ Configuration

All settings live in `config.py`. You can override via environment variables:

- `SECRET_KEY` – Flask session & CSRF protection  
- `SQLALCHEMY_DATABASE_URI` – Database connection string  
- `FLASK_ENV` – Set to `development` or `production`

Additional options can be configured as environment variables as needed.

---

## 📂 Project Structure

```
hal_inventory/
├── blueprints/
│   ├── auth/          # Authentication & user management
│   ├── admin/         # Admin dashboard & user toggles
│   ├── items/         # Inventory item CRUD
│   ├── orders/        # Purchase order workflows
│   └── suppliers/     # Supplier management CRUD
├── extensions.py      # Initialize db, login_manager, migrate
├── models.py          # SQLAlchemy ORM definitions
├── templates/         # Jinja2 templates organized by blueprint
├── static/            # CSS, JS, and image assets
├── migrations/        # Alembic migration scripts
├── run.py             # Application entrypoint
├── config.py          # Configuration settings
├── requirements.txt   # Python dependencies
└── README.md          # Project documentation
```

---

## 📖 Usage

1. **Seed or register** an initial admin user.  
2. **Log in** and explore features via the top navigation:  
   - Inventory Items  
   - Suppliers  
   - Purchase Orders  
   - Consumption Logs  
   - Admin Dashboard  
3. **Toggle** between Light & Dark mode using the header switch.

---

## 🤝 Contributing

1. **Fork** the repository.  
2. **Create** a feature branch:
   ```bash
   git checkout -b feat/your-feature
   ```
3. **Commit** your changes:
   ```bash
   git commit -m "Add your-feature description"
   ```
4. **Push** to your fork:
   ```bash
   git push origin feat/your-feature
   ```
5. **Open** a Pull Request and follow existing code style guidelines.  
6. Include tests for new features and update documentation as needed.

Please adhere to the project's code style, and ensure all new code is properly tested.

---

## 📝 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for full details.
