DROP DATABASE IF EXISTS human_friends;
CREATE DATABASE human_friends;
USE human_friends;

-- Создать таблицы с иерархией из диаграммы в БД

DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
	   id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
       animal_type VARCHAR(100)
       ) COMMENT 'Виды животных';
       
INSERT INTO `animals` (id, animal_type) VALUES (1, 'Pets');
INSERT INTO `animals` (id, animal_type) VALUES (2, 'Pack_animals');


-- Типы животных

DROP TABLE IF EXISTS animal_type;

CREATE TABLE animal_type (
		id SERIAL,
        type_name VARCHAR(100),
        type_id BIGINT UNSIGNED NOT NULL,
        FOREIGN KEY (type_id) REFERENCES animals(id)
        );
INSERT INTO animal_type (id, type_name, type_id) 
VALUES (1, 'dogs', 1),
	   (2, 'cats', 1),
       (3, 'hamsters', 1),
       (4, 'horses', 2),
       (5, 'camals', 2),
       (6, 'donkeys', 2);

        
        
-- Заполнить низкоуровневые таблицы именами(животных), командами, которые они выполняют и датами рождения

DROP TABLE IF EXISTS animal_discription;

CREATE TABLE animal_discription (
		id SERIAL,
        animal_name VARCHAR(100),
        birth_date DATE,
        animal_command TEXT,
        animal_type BIGINT UNSIGNED NOT NULL,
        FOREIGN KEY (animal_type) REFERENCES animal_type(id)
        );
        
INSERT INTO animal_discription (id, animal_name, birth_date, animal_command, animal_type) 
VALUES (1, 'Арчи', '2022-01-03', 'Сидеть, Лежать', 1),
	   (2, 'Мич', '2021-05-30', 'Голос, Аппорт, Сидеть, Лежать', 1),
       (3, 'Мурка', '2020-07-14', 'Кушать', 2),
       (4, 'Барсик', '2019-03-22', 'Не дри обои', 2),
       (5, 'Ксюша', '2018-01-17', '', 3),
       (6, 'Пегас', '2017-07-01', '', 4),
       (7, 'Рашид', '2020-01-05', 'Лежать', 5),
       (8, 'Шрек', '2021-10-09', 'Голос', 6)
;


--  Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу
SELECT animal_name, birth_date, animal_type FROM animal_discription;

DELETE FROM animal_discription
WHERE animal_type = 5;

SELECT animal_name, birth_date, animal_type FROM animal_discription;
        
/* Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
*/
DROP TABLE IF EXISTS young_animal;
       
CREATE TABLE young_animal
SELECT id, animal_name, birth_date, animal_command, animal_type
  FROM animal_discription
 WHERE birth_date = TIMESTAMPDIFF(YEAR, birth_date, NOW()) < 1 AND TIMESTAMPDIFF(YEAR, birth_date, NOW()) < 3 ;
 
 SELECT * FROM young_animal;
 
 
 SELECT * FROM animals
 CROSS JOIN animal_type, animal_discription, young_animal;