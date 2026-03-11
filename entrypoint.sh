#!/bin/bash
# OrderChecker v5.0 - Docker Entrypoint

# Запуск Xvfb (виртуальный X сервер) для GUI
Xvfb :99 -screen 0 1024x768x24 &
XVFB_PID=$!

# Ждём запуска X сервера
sleep 2

# Экспорт DISPLAY
export DISPLAY=:99

echo "🚀 OrderChecker v5.0 запущен в Docker"
echo "===================================="
echo ""

# Запуск приложения
/app/OrderChecker

# Очистка
kill $XVFB_PID
