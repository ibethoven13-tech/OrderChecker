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
    dnf install -y python3-tkinter libxcb
elif [ "$DISTRO" = "centos" ] || [ "$DISTRO" = "redhat" ]; then
    yum install -y python3-tkinter libxcb
else
    echo "⚠️ Неизвестный дистрибутив, пропускаю установку зависимостей"
fi

# Создаём директорию
INSTALL_DIR="/opt/OrderChecker"
echo "📁 Установка в: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# Копируем бинарник
echo "📋 Копирую файлы..."
cp OrderChecker-linux "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/OrderChecker-linux"

# Создаём ярлык
echo "🔗 Создаю ярлык..."
cat > /usr/share/applications/orderchecker.desktop << 'DESKTOP'
[Desktop Entry]
Version=1.0
Type=Application
Name=OrderChecker v5.0
Comment=Поиск совпадений по реестру
Exec=$INSTALL_DIR/OrderChecker-linux
Icon=orderchecker
Terminal=false
Categories=Office;Finance;Development;
DESKTOP

chmod +x /usr/share/applications/orderchecker.desktop

# Создаём ярлык на рабочем столе для всех пользователей
for user_dir in /home/*/; do
    desktop_dir="$user_dir/Desktop"
    if [ -d "$desktop_dir" ]; then
        cp /usr/share/applications/orderchecker.desktop "$desktop_dir/"
        chown $(basename "$user_dir") "$(basename "$user_dir")" "$desktop_dir/orderchecker.desktop"
        chmod +x "$desktop_dir/orderchecker.desktop"
    fi
done

echo ""
echo "======================================"
echo "✅ Установка завершена!"
echo "======================================"
echo ""
echo "📁 Бинарник: $INSTALL_DIR/OrderChecker-linux"
echo "🔗 Ярлык создан для всех пользователей"
echo ""
echo "Для запуска:"
echo "  1. Через меню приложений"
echo "  2. Или через ярлык на рабочем столе"
echo "  3. Или из терминала: $INSTALL_DIR/OrderChecker-linux"
echo ""
echo "🎉 Готово к работе!"
