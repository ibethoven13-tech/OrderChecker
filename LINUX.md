# 🐧 OrderChecker v5.0 - Установка на Linux (Red Hat/Fedora/CentOS)

## 🎯 Что это?

**Один файл** который работает сразу после копирования на Linux - никакой установки Python и зависимостей!

---

## 📦 Установка (3 варианта)

### ВАРИАНТ 1: Автоматическая установка (рекомендуется)

```bash
# 1. Скопируйте папку OrderChecker_DEPLOY на Linux
scp -r OrderChecker_DEPLOY user@linux:/home/user/

# 2. На Linux машине:
cd OrderChecker_DEPLOY
sudo bash install-linux.sh
```

**Готово!** Ярлык появится в меню и на рабочем столе.

---

### ВАРИАНТ 2: Ручная установка

```bash
# 1. Скопируйте бинарник
sudo mkdir -p /opt/OrderChecker
sudo cp OrderChecker-linux /opt/OrderChecker/OrderChecker-linux
sudo chmod +x /opt/OrderChecker/OrderChecker-linux

# 2. Установите зависимости
sudo dnf install python3-tkinter
# или
sudo yum install python3-tkinter

# 3. Запустите
/opt/OrderChecker/OrderChecker-linux
```

---

### ВАРИАНТ 3: Из домашней папки (без root)

```bash
# 1. Скопируйте в домашнюю папку
cp OrderChecker-linux ~/
chmod +x ~/OrderChecker-linux

# 2. Создайте ярлык
cat > ~/Desktop/OrderChecker.desktop << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=OrderChecker
Exec=/home/$USER/OrderChecker-linux
Terminal=false
EOF

chmod +x ~/Desktop/OrderChecker.desktop

# 3. Запуск
./OrderChecker-linux
```

---

## 🚀 Запуск приложения

### Через ярлык (DE)
- Меню приложений → Office → OrderChecker v5.0
- Двойной клик по ярлыку на рабочем столе

### Через терминал
```bash
/opt/OrderChecker/OrderChecker-linux
```

---

## 🔧 Troubleshooting

### Проблема: "No module named 'tkinter'"
```bash
sudo dnf install python3-tkinter
```

### Проблема: "Permission denied"
```bash
chmod +x OrderChecker-linux
```

### Проблема: "Cannot open display"
```bash
sudo dnf install libX11 libxcb
```

---

## ✅ Проверка работы

После запуска должно открыться окно приложения с:
- Названием "Поиск совпадений по реестру"
- Кнопками для загрузки реестра и документов
- Кнопкой "Обработать"

---

## 🎉 Готово к работе!

**Один файл = всё включено!**
- ✅ Нет необходимости устанавливать Python
- ✅ Все зависимости внутри
- ✅ Работает на любом x86_64 Linux

**Просто скопируй файл на Linux и запусти!**
