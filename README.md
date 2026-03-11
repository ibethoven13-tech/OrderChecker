# 🚀 OrderChecker v5.0 - Деплой пакет

## ⚡ Быстрый старт (ОДНА КОМАНДА)

### Linux:
```bash
cd OrderChecker_DEPLOY && bash QUICK_START.sh
```

### macOS:
```bash
cd OrderChecker_DEPLOY && bash QUICK_START.sh
```

---

## 📁 Что в папке:

```
OrderChecker_DEPLOY/
├── order_checker_v5_registry_learning.py  # 🎯 Главный скрипт (124KB)
├── requirements.txt                        # 📦 Python зависимости
├── QUICK_START.sh                          # ⚡ Быстрая настройка (ОДНА КОМАНДА!)
├── install.sh                              # 🔧 Полный инсталлятор
└── SETUP.md                                # 📖 Подробная инструкция
```

---

## 🎯 3 шага для запуска:

### 1️⃣ Быстрая настройка
```bash
bash QUICK_START.sh
```

### 2️⃣ Запуск приложения
```bash
python3 order_checker_v5_registry_learning.py
```

### 3️⃣ Готово! Используйте приложение

---

## 🤖 Ollama (опционально)

```bash
curl -fsSL https://ollama.ai/install.sh | sh
ollama serve &
ollama pull llama3.2
```

---

## ✅ Проверка перед запуском

```bash
# Python 3.8+
python3 --version

# Зависимости установлены
pip3 list | grep customtkinter

# Рабочие папки созданы
ls ~/.orderchecker_logs
```

---

## 🎉 Всё готово!

```bash
python3 order_checker_v5_registry_learning.py
```
