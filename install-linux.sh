#!/bin/bash
# OrderChecker v5.0 - Инсталлятор для Linux
# Работает на Fedora/CentOS/RHEL (Red Hat)

set -e

echo "🚀 OrderChecker v5.0 - Установка на Linux"
echo "======================================"
echo ""

# Проверка прав root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Нужны права root (sudo)"
    exit 1
fi

# Определяем дистрибутив
if [ -f /etc/redhat-release ]; then
    DISTRO="redhat"
elif command -v dnf &> /dev/null; then
    DISTRO="fedora"
elif command -v yum &> /dev/null; then
    DISTRO="centos"
else
    DISTRO="unknown"
fi

echo "📌 Обнаружен дистрибутив: $DISTRO"
echo ""

# Установка зависимостей
echo "📦 Установка зависимостей..."
if [ "$DISTRO" = "fedora" ]; then
    dnf install -y python3-tkinter libxcb 2>/dev/null || dnf install -y python3-tkinter
elif [ "$DISTRO" = "centos" ] || [ "$DISTRO" = "redhat" ]; then
    yum install -y python3-tkinter libxcb 2>/dev/null || yum install -y python3-tkinter
else
    echo "⚠️ Неизвестный дистрибутив, пропускаю установку зависимостей"
fi

# Создаём директорию
INSTALL_DIR="/opt/OrderChecker"
echo "📁 Установка в: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# Копируем бинарник
echo "📋 Копирую файлы..."
if [ -f "OrderChecker-linux" ]; then
    cp OrderChecker-linux "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/OrderChecker-linux"
else
    echo "❌ Файл OrderChecker-linux не найден!"
    echo "📥 Скачайте его из: https://github.com/ibethoven13-tech/OrderChecker/actions"
    exit 1
fi

# Создаём ярлык для меню приложений
echo "🔗 Создаю ярлык в меню приложений..."
cat > /usr/share/applications/orderchecker.desktop << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=OrderChecker v5.0
Name[ru]=OrderChecker v5.0
Comment=Поиск совпадений по реестру
Comment[ru]=Поиск совпадений по реестру
GenericName=Registry Checker
GenericName[ru]=Сверка документов
Exec=/opt/OrderChecker/OrderChecker-linux %F
Icon=orderchecker
Terminal=false
StartupNotify=true
StartupWMClass=OrderChecker
NoDisplay=false
Categories=Office;Finance;Development;
Keywords=registry;checker;documents;excel;
Keywords[ru]=реестр;сверка;документы;excel;
EOF

chmod +x /usr/share/applications/orderchecker.desktop

# Обновляем кэш desktop файлов (для GNOME/KDE)
if command -v update-desktop-database &> /dev/null; then
    update-desktop-database /usr/share/applications/ 2>/dev/null || true
fi

# Создаём ярлык на рабочем столе для всех пользователей
echo "🖥️  Создаю ярлыки на рабочих столах..."
for user_dir in /home/*/; do
    desktop_dir="$user_dir/Desktop"
    if [ -d "$desktop_dir" ]; then
        user_name=$(basename "$user_dir")
        cp /usr/share/applications/orderchecker.desktop "$desktop_dir/"
        chown "$user_name":"$user_name" "$desktop_dir/orderchecker.desktop"
        chmod +x "$desktop_dir/orderchecker.desktop"
    fi
done

echo ""
echo "======================================"
echo "✅ Установка завершена!"
echo "======================================"
echo ""
echo "📁 Бинарник: $INSTALL_DIR/OrderChecker-linux"
echo "🔗 Ярлык создан в меню приложений"
echo "🖥️  Ярлыки на рабочих столах созданы"
echo ""
echo "Для запуска:"
echo "  1. Через меню приложений → Office → OrderChecker v5.0"
echo "  2. Двойной клик по ярлыку на рабочем столе"
echo "  3. Из терминала: $INSTALL_DIR/OrderChecker-linux"
echo ""
echo "📝 Примечание:"
echo "  - Ollama запускается автоматически при старте приложения"
echo "  - Для работы LLM установите Ollama: https://ollama.com"
echo "  - После установки Ollama: ollama pull llama3.2"
echo ""
echo "🎉 Готово к работе!"
