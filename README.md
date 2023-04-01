# messenger
A series of microservices in monorepe (golang, docker, ngnix)

### Структура:
1. api - приложение должно принимать HTTP запросы от postman/браузера, валидировать и прокидывать далее на backend приложение для записи в бд.
2. backend - приложение принимает данные от api, записывает в бд и возвращяет информацию о статусе записи.
3. db - креды для базы данных
4. docker-entrypoint-initdb.d - sql для первичного развертывания бд
5. proxy - конфиг для ngnix

### Команды запуска:

```text
docker-compose down --remove-orphans
```
```text
docker-compose build
```
```text
docker-compose up -d
```

### Проверка работоспособности в postman:

```text
POST http://localhost/message

Содержимое body [x-www-form-urlencoded]
user_id: 1
channel_id: 3
text: Текст сообщения в чат
```