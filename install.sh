#!/bin/bash
# OrderChecker v5.0 - Install Script
# Автоматическая установка и настройка

set -e

echo "🚀 OrderChecker v5.0 - Установка"
echo "===================================="

# Определение ОС
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    echo "❌ Неподдерживаемая ОС: $OSTYPE"
    exit 1
fi

echo "📌 ОС: $OS"

# Проверка Python
echo "🐍 Проверка Python..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 не установлен"
    exit 1
fi

PYTHON_VERSION=$(python3 --version)
echo "✅ $PYTHON_VERSION"

# Установка зависимостей
echo ""
echo "📦 Установка Python зависимостей..."
pip3 install customtkinter pandas openpyxl python-docx pdfplumber requests

# Создание рабочих директорий
echo ""
echo "📁 Создание рабочих директорий..."
mkdir -p ~/.orderchecker_logs
mkdir -p ~/.orderchecker_data
echo "✅ Директории созданы"

# Предложение Ollama
echo ""
read -p "Установить Ollama для LLM? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🤖 Установка Ollama..."
    curl -fsSL https://ollama.ai/install.sh | sh
    echo "✅ Ollama установлен"
    echo "Запустите: ollama serve"
    echo "Загрузите модель: ollama pull llama3.2"
fi

echo ""
echo "===================================="
echo "✅ Установка завершена!"
echo "===================================="
echo ""
echo "Запуск приложения:"
echo "  python3 order_checker_v5_registry_learning.py"
echo ""
