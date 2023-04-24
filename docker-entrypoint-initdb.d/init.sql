-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               PostgreSQL 13.2 (Debian 13.2-1.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
-- Операционная система:         
-- HeidiSQL Версия:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица public.last_message
CREATE TABLE IF NOT EXISTS "last_message" (
	"channel_id" INTEGER NOT NULL,
	"message_id" INTEGER NOT NULL,
	PRIMARY KEY ("channel_id", "message_id")
);

-- Дамп данных таблицы public.last_message: 0 rows
DELETE FROM "last_message";
/*!40000 ALTER TABLE "last_message" DISABLE KEYS */;
/*!40000 ALTER TABLE "last_message" ENABLE KEYS */;

-- Дамп структуры для таблица public.last_seen
CREATE TABLE IF NOT EXISTS "last_seen" (
	"user_id" INTEGER NOT NULL,
	"channel_id" INTEGER NOT NULL,
	"message_id" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("user_id", "channel_id")
);

-- Дамп данных таблицы public.last_seen: 0 rows
DELETE FROM "last_seen";
/*!40000 ALTER TABLE "last_seen" DISABLE KEYS */;
/*!40000 ALTER TABLE "last_seen" ENABLE KEYS */;

-- Дамп структуры для таблица public.message
CREATE TABLE IF NOT EXISTS "message" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''message_id_seq''::regclass)',
	"user_id" INTEGER NOT NULL,
	"channel_id" INTEGER NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"text" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Дамп данных таблицы public.message: 0 rows
DELETE FROM "message";
/*!40000 ALTER TABLE "message" DISABLE KEYS */;
INSERT INTO "message" ("id", "user_id", "channel_id", "created_at", "text") VALUES
	(1, 1, 1, '2023-03-31 12:34:47', 'Тестовое сообщение'),
	(2, 2, 1, '2023-03-31 12:35:12', 'Ответ на сообщение пользователя 1'),
	(3, 1, 1, '2023-03-31 12:35:31', 'Ну и еще одно сообщение');
/*!40000 ALTER TABLE "message" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
