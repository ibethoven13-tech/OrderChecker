#!/bin/bash
# OrderChecker v5.0 - Кросс-компиляция Linux без Docker
# Создаёт Linux бинарник используя pyinstaller с Linux target

set -e

echo "🐧 OrderChecker v5.0 - Сборка Linux версии"
echo "=============================================="
echo ""

# Проверка Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 не установлен"
    exit 1
fi

# Установка зависимостей
echo "📦 Установка зависимостей..."
pip3 install pyinstaller customtkinter pandas openpyxl python-docx pdfplumber requests

# Очистка
rm -rf build dist

# Сборка с указанием platform (экспериментально)
echo "🔨 Сборка Linux бинарника..."
pyinstaller \
    --onefile \
    --windowed \
    --name "OrderChecker-linux" \
    --hidden-import=tkinter \
    --hidden-import=customtkinter \
    --hidden-import=pandas \
    --hidden-import=openpyxl \
    --hidden-import=docx \
    --hidden-import=pdfplumber \
    --hidden-import=requests \
    --clean \
    --noconfirm \
    --target-arch=x86_64 \
    order_checker_v5_registry_learning.py

echo ""
echo "✅ Сборка завершена!"
echo "📁 Файл: dist/OrderChecker-linux"
echo ""
echo "⚠️ Это macOS binary с попыткой Linux target."
echo "Для гарантированной Linux версии нужен Docker или Linux машина."
