CREATE SCHEMA `mydb`;

CREATE TABLE `mydb`.`Author` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL
);

CREATE TABLE `mydb`.`Book` (
  `ISBN` VARCHAR(13) PRIMARY KEY NOT NULL,
  `Title` VARCHAR(100) NOT NULL,
  `PubYear` INT NOT NULL,
  `AuthorID` INT NOT NULL
);

CREATE TABLE `mydb`.`Borrower` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `ContactInfo` VARCHAR(100) NOT NULL,
  `BookISBN` VARCHAR(13) NOT NULL
);

CREATE UNIQUE INDEX `Name_UNIQUE` ON `mydb`.`Author` (`Name`);

CREATE UNIQUE INDEX `Title_UNIQUE` ON `mydb`.`Book` (`Title`);

CREATE UNIQUE INDEX `AuthorID_UNIQUE` ON `mydb`.`Book` (`AuthorID`);

CREATE UNIQUE INDEX `id_UNIQUE` ON `mydb`.`Borrower` (`id`);

CREATE UNIQUE INDEX `FirstName_UNIQUE` ON `mydb`.`Borrower` (`FirstName`);

CREATE UNIQUE INDEX `LastName_UNIQUE` ON `mydb`.`Borrower` (`LastName`);

CREATE UNIQUE INDEX `ContactInfo_UNIQUE` ON `mydb`.`Borrower` (`ContactInfo`);

CREATE UNIQUE INDEX `BookISBN_UNIQUE` ON `mydb`.`Borrower` (`BookISBN`);

ALTER TABLE `mydb`.`Book` ADD CONSTRAINT `id` FOREIGN KEY (`AuthorID`) REFERENCES `mydb`.`Author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`Borrower` ADD CONSTRAINT `ISBN` FOREIGN KEY (`BookISBN`) REFERENCES `mydb`.`Book` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION;
