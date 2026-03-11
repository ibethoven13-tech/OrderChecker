#!/bin/bash
# OrderChecker v5.0 - Быстрый старт
# Выполните этот файл для автоматической настройки

echo "🚀 OrderChecker v5.0 - Быстрый старт"
echo "======================================"
echo ""

# Определение ОС
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "📌 Linux detected"
    
    echo "📦 Установка зависимостей..."
    sudo apt update
    sudo apt install -y python3 python3-pip python3-tk libxcb-xinerama0
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "📌 macOS detected"
    
    if ! command -v brew &> /dev/null; then
        echo "📦 Установка Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    echo "📦 Установка Python..."
    brew install python@3.11
else
    echo "❌ Неподдерживаемая ОС"
    exit 1
fi

echo ""
echo "🐍 Установка Python пакетов..."
pip3 install customtkinter pandas openpyxl python-docx pdfplumber requests

echo ""
echo "📁 Создание рабочих директорий..."
mkdir -p ~/.orderchecker_logs
mkdir -p ~/.orderchecker_data

echo ""
echo "✅ Настройка завершена!"
echo ""
echo "Для запуска приложения:"
echo "  cd $(pwd)"
echo "  python3 order_checker_v5_registry_learning.py"
echo ""
