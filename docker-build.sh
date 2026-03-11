#!/bin/bash
# OrderChecker v5.0 - Docker Build Script
# Сборка Linux бинарника через Docker

set -e

echo "🐳 OrderChecker v5.0 - Docker сборка Linux версии"
echo "======================================================"
echo ""

# Проверка Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker не установлен"
    echo "Установите Docker: https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✅ Docker найден: $(docker --version)"
echo ""

# Сборка build образа
echo "🔨 Сборка build образа..."
docker build -f Dockerfile.build -t orderchecker-build .

echo ""
echo "📦 Извлечение бинарника..."
rm -rf docker-dist
mkdir -p docker-dist

# Запуск контейнера и копирование бинарника
docker run --rm -v "$(pwd)/docker-dist:/dist" orderchecker-build bash -c "cp /app/dist/OrderChecker /dist/"

echo ""
echo "======================================================"
echo "✅ Сборка завершена!"
echo "======================================================"
echo ""
echo "📁 Linux бинарник: docker-dist/OrderChecker"
echo "📊 Размер: $(du -h docker-dist/OrderChecker | cut -f1)"
echo ""

# Предложение создать runtime Docker
echo "======================================================"
read -p "Создать runtime Docker образ? (y/N): " -n 1 -r
echo
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🐳 Создание runtime Docker образа..."

    # Копируем бинарник в dist для runtime
    cp docker-dist/OrderChecker dist/

    # Сборка runtime образа
    docker build -f Dockerfile.run -t orderchecker:latest .

    echo ""
    echo "✅ Runtime образ создан: orderchecker:latest"
    echo ""
    echo "Для запуска:"
    echo "  docker run -it --rm orderchecker:latest"
    echo ""
    echo "С копированием файлов:"
    echo "  docker run -it --rm -v /path/to/files:/files orderchecker:latest"
    echo ""
fi

echo "🎉 Готово!"
