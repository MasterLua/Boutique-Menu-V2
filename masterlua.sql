ALTER TABLE `users` ADD almacoinn int;
ALTER TABLE `users` ALTER almacoinn SET DEFAULT '0';
ALTER TABLE `users` MODIFY almacoinn int NOT NULL;