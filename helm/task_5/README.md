# Nginx Helm Chart

Кастомный Helm-чарт для развертывания Nginx с параметризацией.

## Основные параметры

### 1. Количество реплик

Управляет количеством экземпляров Nginx:

```yaml
replicaCount: 3
```

### 2. Образ и версия

Настройка используемого Docker-образа:

```yaml
image:
  repository: nginx      # Репозиторий образа
  tag: "1.25.3"         # Версия образа
  pullPolicy: IfNotPresent  # Политика загрузки
```

### 3. Конфигурация сервиса

Настройка типа сервиса и портов:

```yaml
service:
  type: NodePort        # Тип: ClusterIP, NodePort, LoadBalancer
  port: 80             # Порт сервиса
  nodePort: 30080      # NodePort (только для type: NodePort)
```

## Установка

### Базовая установка

```bash
helm install my-nginx .
```

### Установка с кастомными параметрами

```bash
helm install my-nginx . \
  --set replicaCount=5 \
  --set image.tag=1.24.0 \
  --set service.type=ClusterIP
```

### Установка с файлом значений

Создайте файл `custom-values.yaml`:

```yaml
replicaCount: 2

image:
  repository: nginx
  tag: "1.25.3"

service:
  type: NodePort
  port: 80
  nodePort: 30090
```

Установите чарт:

```bash
helm install my-nginx . -f custom-values.yaml
```

## Примеры конфигураций

### Пример 1: ClusterIP (внутренний доступ)

```yaml
replicaCount: 3

service:
  type: ClusterIP
  port: 80
```

### Пример 2: NodePort (доступ через порт ноды)

```yaml
replicaCount: 2

service:
  type: NodePort
  port: 80
  nodePort: 30080
```

### Пример 3: Разные версии Nginx

```yaml
# Последняя стабильная версия
image:
  tag: "1.25.3"

# Или alpine версия для меньшего размера
image:
  repository: nginx
  tag: "1.25.3-alpine"
```

## Проверка развертывания

После установки проверьте статус:

```bash
# Проверка релиза
helm list

# Проверка подов
kubectl get pods

# Проверка сервиса
kubectl get svc

# Подробная информация
helm status my-nginx
```

## Обновление

Изменить параметры существующего релиза:

```bash
helm upgrade my-nginx . \
  --set replicaCount=4 \
  --set service.nodePort=30081
```

## Удаление

```bash
helm uninstall my-nginx
```

## Структура чарта

```
.
├── Chart.yaml              # Метаданные чарта
├── values.yaml             # Значения по умолчанию
├── templates/
│   ├── deployment.yaml     # Deployment с использованием параметров
│   ├── service.yaml        # Service с NodePort/ClusterIP
│   ├── _helpers.tpl        # Вспомогательные шаблоны
│   └── ...
└── README.md               # Документация
```
