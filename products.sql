CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    UserType ENUM('Buyer', 'Seller', 'Admin') NOT NULL
);

CREATE TABLE Categories (
    CategoryID int NOT NULL AUTO_INCREMENT,
    CategoryName varchar(255) NOT NULL,
    PRIMARY KEY (CategoryID)
);

INSERT INTO Categories (CategoryName) VALUES ('Casa e Jardim'), ('Vestuário'), ('Acessórios'), ('Eletrónicos'), ('Automóveis'), ('Sapatos'), ('Telemóveis'), ('Desporto'), ('Beleza e Saúde'), ('Ferramentas'), ('Descontos'), ('Outros');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    Brand VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Size VARCHAR(255) NOT NULL,
    Condition VARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE ProductImages (
    ImageID INT PRIMARY KEY,
    ImageURL VARCHAR(255) NOT NULL,
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Wishlist (
    UserID INT,
    ProductID INT,
    PRIMARY KEY (UserID, ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCart (
    UserID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (UserID, ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);




-- Inserting data into the tables, for testing


INSERT INTO Users (UserID, Name, Username, Password, Email, UserType)
VALUES 
(1, 'John Doe', 'johndoe', 'password1', 'johndoe@example.com', 'Buyer'),
(2, 'Jane Smith', 'janesmith', 'password2', 'janesmith@example.com', 'Seller'),
(3, 'Bob Johnson', 'bobjohnson', 'password3', 'bobjohnson@example.com', 'Buyer'),
(4, 'Alice Williams', 'alicewilliams', 'password4', 'alicewilliams@example.com', 'Seller'),
(5, 'Charlie Brown', 'charliebrown', 'password5', 'charliebrown@example.com', 'Buyer'),
(6, 'Lucy Green', 'lucygreen', 'password6', 'lucygreen@example.com', 'Seller'),
(7, 'Tom White', 'tomwhite', 'password7', 'tomwhite@example.com', 'Buyer'),
(8, 'Sally Black', 'sallyblack', 'password8', 'sallyblack@example.com', 'Seller'),
(9, 'David Gray', 'davidgray', 'password9', 'davidgray@example.com', 'Buyer'),
(10, 'Susan Yellow', 'susanyellow', 'password10', 'susanyellow@example.com', 'Seller'),
(11, 'James Red', 'jamesred', 'password11', 'jamesred@example.com', 'Buyer'),
(12, 'Jennifer Blue', 'jenniferblue', 'password12', 'jenniferblue@example.com', 'Seller'),
(13, 'Robert Purple', 'robertpurple', 'password13', 'robertpurple@example.com', 'Buyer'),
(14, 'Linda Orange', 'lindaorange', 'password14', 'lindaorange@example.com', 'Seller'),
(15, 'Michael Pink', 'michaelpink', 'password15', 'michaelpink@example.com', 'Buyer'),
(16, 'Elizabeth Gold', 'elizabethgold', 'password16', 'elizabethgold@example.com', 'Seller'),
(17, 'William Silver', 'williamsilver', 'password17', 'williamsilver@example.com', 'Buyer'),
(18, 'Patricia Bronze', 'patriciabronze', 'password18', 'patriciabronze@example.com', 'Seller'),
(19, 'Joseph Copper', 'josephcopper', 'password19', 'josephcopper@example.com', 'Buyer'),
(20, 'Maria Platinum', 'mariaplatinum', 'password20', 'mariaplatinum@example.com', 'Seller');