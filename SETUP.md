# ⚡ OrderChecker v5.0 - Быстрая настройка ПК

## 🖥️ Преднастройка ПК (выполнить в консоли)

### Linux (Ubuntu/Debian)

```bash
# 1. Обновление системы
sudo apt update && sudo apt upgrade -y

# 2. Установка Python и зависимостей
sudo apt install -y python3 python3-pip python3-tk
sudo apt install -y libxcb-xinerama0

# 3. Установка pip зависимостей
pip3 install customtkinter pandas openpyxl python-docx pdfplumber requests

# 4. Создание рабочих папок
mkdir -p ~/.orderchecker_logs
mkdir -p ~/.orderchecker_data

# 5. Переход в папку приложения
cd OrderChecker_DEPLOY

# 6. Запуск инсталлятора
bash install.sh
```

### macOS

```bash
# 1. Установка Homebrew (если нет)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Установка Python
brew install python@3.11 python-tk@3.11

# 3. Установка зависимостей
pip3 install customtkinter pandas openpyxl python-docx pdfplumber requests

# 4. Создание рабочих папок
mkdir -p ~/.orderchecker_logs
mkdir -p ~/.orderchecker_data

# 5. Переход в папку приложения
cd OrderChecker_DEPLOY

# 6. Запуск инсталлятора
bash install.sh
```

---

## 🚀 Запуск приложения

```bash
cd OrderChecker_DEPLOY
python3 order_checker_v5_registry_learning.py
```

---

## 🤖 Ollama (опционально)

```bash
curl -fsSL https://ollama.ai/install.sh | sh
ollama serve &
ollama pull llama3.2
```

---

## ✅ Проверка

```bash
python3 --version  # 3.8+
pip3 list | grep customtkinter
```

---

## 🎉 Готово!

```bash
python3 order_checker_v5_registry_learning.py
```
