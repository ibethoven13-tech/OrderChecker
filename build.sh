#!/bin/bash
# OrderChecker v5.0 - Build Script
# Упаковка в один исполняемый файл

set -e

echo "🔨 OrderChecker v5.0 - Сборка исполняемого файла"
echo "===================================================="

# Проверка PyInstaller
if ! command -v pyinstaller &> /dev/null; then
    echo "📦 Установка PyInstaller..."
    pip3 install pyinstaller
fi

# Определение платформы
PLATFORM=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLATFORM="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macos"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    PLATFORM="windows"
else
    echo "❌ Неизвестная платформа: $OSTYPE"
    exit 1
fi

echo "📌 Платформа: $PLATFORM"

# Установка зависимостей для packaging
echo "📦 Установка packaging зависимостей..."
pip3 install pyinstaller customtkinter pandas openpyxl python-docx pdfplumber requests

# Очистка предыдущей сборки
echo "🧹 Очистка предыдущей сборки..."
rm -rf build dist

# Сборка
echo "🔨 Сборка..."
if [ "$PLATFORM" = "linux" ]; then
    # Linux - один файл
    pyinstaller \
        --onefile \
        --windowed \
        --name "OrderChecker" \
        --icon=icon.png \
        --add-data "order_checker_v5_registry_learning.py:." \
        --hidden-import=tkinter \
        --hidden-import=customtkinter \
        --hidden-import=pandas \
        --hidden-import=openpyxl \
        --hidden-import=docx \
        --hidden-import=pdfplumber \
        order_checker_v5_registry_learning.py

elif [ "$PLATFORM" = "macos" ]; then
    # macOS - app bundle
    pyinstaller \
        --onefile \
        --windowed \
        --name "OrderChecker" \
        --icon=icon.icns \
        order_checker_v5_registry_learning.py

else
    # Windows
    pyinstaller \
        --onefile \
        --windowed \
        --name "OrderChecker" \
        --icon=icon.ico \
        order_checker_v5_registry_learning.py
fi

echo ""
echo "===================================================="
echo "✅ Сборка завершена!"
echo "===================================================="
echo ""

if [ "$PLATFORM" = "linux" ]; then
    echo "📁 Исполняемый файл: dist/OrderChecker"
    echo ""
    echo "Для запуска:"
    echo "  ./dist/OrderChecker"
    echo ""
elif [ "$PLATFORM" = "macos" ]; then
    echo "📁 Приложение: dist/OrderChecker.app"
    echo ""
    echo "Для запуска:"
    echo "  open dist/OrderChecker.app"
    echo ""
else
    echo "📁 Исполняемый файл: dist/OrderChecker.exe"
    echo ""
    echo "Для запуска:"
    echo "  OrderChecker.exe"
    echo ""
fi

# Опционально: создать AppImage для Linux
if [ "$PLATFORM" = "linux" ]; then
    echo ""
    read -p "Создать AppImage? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📦 Создание AppImage..."
        echo "Требуется: pip3 install python-appimage"
    fi
fi
