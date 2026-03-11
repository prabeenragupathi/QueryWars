# ⚔️ Query War: Gamified Database Challenges

Welcome to **SQL Arena**! This repository is an open-source learning platform designed to help you master SQL through immersive, story-driven investigations and real-world database scenarios.

Forget the boring, standard tutorials where you just "find the employee with the highest salary." In the real world, databases are messy, filled with noise, and require complex logic to extract the truth. That is exactly what you will practice here.

## 🧠 Why Learn Here?
* **Story-Driven Learning:** Solve mysteries, track down syndicates, or debug complex corporate networks.
* **Realistic "Noise":** Our advanced databases are populated with thousands of rows of decoy data. You can't just eyeball the answers—you have to write highly optimized `JOIN`s, aggregations, and subqueries.
* **Instant Setup:** Use our automated script to build and populate your challenge databases in seconds.

---

## 🚀 Quick Start Guide

We have built a custom Windows batch script to instantly download and build the databases on your local machine so you can jump straight to coding.

### Prerequisites
1. **PostgreSQL** (Version 10 or higher) must be installed.
2. **`psql` must be added to your Windows PATH**. 
> *To check: Open Command Prompt and type `psql -V`. If it returns a version number, you are good to go! If it says "not recognized", add your PostgreSQL `bin` folder (e.g., `C:\Program Files\PostgreSQL\15\bin`) to your Windows Environment Variables.*

### Installation Steps
1. Clone this repository or download the `download_game.bat` file.
2. Double-click `download_game.bat` to run the installer.
3. Enter your PostgreSQL username (default is usually `postgres`).
4. Type the **Index Number** of the case you want to play and hit Enter.
5. The script will automatically fetch the SQL file, create the database, and populate all the tables!

### Manual Installation
If you are on macOS/Linux or prefer doing it manually, you can navigate to the `/questions` folder, copy the raw `.sql` files, and execute them directly in your database GUI (like pgAdmin or DBeaver).

---

## 💻 Connecting & Playing

Once the setup is successful, open your `psql` terminal or your database GUI and connect to your chosen challenge:

```bash
# For the cases
\c table_name
