-- region Drop tables
-- Table 'utilisateurs'
DROP TABLE IF EXISTS utilisateurs;

-- Table 'livres'
DROP TABLE IF EXISTS livres;

-- Table 'auteurs'
DROP TABLE IF EXISTS auteurs;

-- Table 'langues'
DROP TABLE IF EXISTS langues;

-- Table 'pays'
DROP TABLE IF EXISTS pays;
-- endregion Drop tables

-- region Create tables
-- Table 'pays'
CREATE TABLE pays (
    idPays NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    code VARCHAR2 (5) NOT NULL
);

-- Table 'langues'
CREATE TABLE langues (
    idLangue NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    code VARCHAR2 (5) NOT NULL
);

-- Table 'auteurs'
CREATE TABLE auteurs (
    idAuteur NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    pseudonyme VARCHAR2 (15) DEFAULT 'N/A',
    prenom VARCHAR2 (30) NOT NULL,
    nom VARCHAR2 (30) NOT NULL
);

-- Table 'utilisateurs'
CREATE TABLE utilisateurs (
    idUtilisateur NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    email VARCHAR2 (255) NOT NULL,
    nom VARCHAR2 (30) DEFAULT 'N/A',
    prenom VARCHAR2 (30) DEFAULT 'N/A',
    codePays NUMBER,
    codeLangue NUMBER,
    motDePasseClair VARCHAR2 (255) NOT NULL,
    motDePasseARGON2 VARCHAR2 (255) DEFAULT 'N/A',
    motDePasseSHA256 VARCHAR2 (255) DEFAULT 'N/A',
    motDePasseBCRYPT VARCHAR2 (255) DEFAULT 'N/A',
    CONSTRAINT codePays_fk
        FOREIGN KEY (codePays)
        REFERENCES pays(idPays)
        ON DELETE CASCADE,
    CONSTRAINT codeLanges_fk
        FOREIGN KEY (codeLangue)
        REFERENCES langues(idLangue)
        ON DELETE CASCADE
);

-- Table 'livres'
CREATE TABLE livres (
    idLivre NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    titre VARCHAR2 (255) DEFAULT 'N/A',
    description VARCHAR2 (255) DEFAULT 'N/A',
    cover VARCHAR2 (255) NOT NULL,
    paysOrigine NUMBER,
    langueOrigine NUMBER,
    auteur NUMBER,
    CONSTRAINT paysOrigine_fk
        FOREIGN KEY (paysOrigine)
        REFERENCES pays(idPays)
        ON DELETE CASCADE,
    CONSTRAINT langueOrigine_fk
        FOREIGN KEY (langueOrigine)
        REFERENCES langues(idLangue)
        ON DELETE CASCADE,
    CONSTRAINT auteur_fk
        FOREIGN KEY (auteur)
        REFERENCES auteurs(idAuteur)
        ON DELETE CASCADE
);
-- endregion Create tables

-- region Insert data
-- Table 'pays'
INSERT INTO pays(code) VALUES ('BE');
INSERT INTO pays(code) VALUES ('US');
INSERT INTO pays(code) VALUES ('UK');
INSERT INTO pays(code) VALUES ('FR');
INSERT INTO pays(code) VALUES ('CA');

-- Table 'langues'
INSERT INTO langues(code) VALUES ('FR');
INSERT INTO langues(code) VALUES ('EN');

-- Table 'auteurs'
INSERT INTO auteurs(pseudonyme, nom, prenom) VALUES ('J.K. Rowling', 'Rowling', 'Joanne');
INSERT INTO auteurs(nom, prenom) VALUES ('Hugo', 'Victor');
INSERT INTO auteurs(pseudonyme, nom, prenom) VALUES ('J.R.R.', 'Reuel Tolkien', 'John Ronald');
INSERT INTO auteurs(pseudonyme, nom, prenom) VALUES ('Herg�', 'Prosper Remi', 'Georges');

-- Table 'utilisateurs'
INSERT INTO utilisateurs(nom, prenom, email, codePays, codeLangue, motDePasseClair) VALUES ('Simpson', 'Homer', 'homer_simpson@gmail.com', 2, 2, 'dnu9QAC3');
INSERT INTO utilisateurs(nom, prenom, email, codePays, codeLangue, motDePasseClair) VALUES ('Bond', 'James', 'james_bond@gmail.com', 3, 2, 'ngr4M0Lz');
INSERT INTO utilisateurs(nom, prenom, email, codePays, codeLangue, motDePasseClair) VALUES ('Gratton', 'Bob', 'bob_gratton@gmail.com', 5, 1, 'ty9rA715');

-- Table 'livres'
INSERT INTO livres(titre, description, cover, paysOrigine, langueOrigine, auteur) VALUES ('Tintin: Vol 714 pour Sydney', 'Dans cette nouvelle aventure, nous retrouvons Tintin, Haddock et Tournesol ...', 'https://images.renaud-bray.com/images/PG/17/17912-gf.jpg', 1, 1, 4);
INSERT INTO livres(titre, description, cover, paysOrigine, langueOrigine, auteur) VALUES ('Harry Potter � l�cole des sorciers', 'Le jour de ses onze ans, Harry Potter, ...', 'https://images.renaud-bray.com/images/PG/2345/2345638-gf.jpg', 3, 2, 1);
INSERT INTO livres(titre, description, cover, paysOrigine, langueOrigine, auteur) VALUES ('Le seigneur des anneaux : La Fraternitit� de lanneau', 'Dans les vertes prairies de la Comt�, ...', 'https://images.renaud-bray.com/images/PG/2595/2595041-gf.jpg', 3, 2, 3);
INSERT INTO livres(titre, description, cover, paysOrigine, langueOrigine, auteur) VALUES ('Les mis�rables', 'Sous la monarchie de Juillet, ...', 'https://images.renaud-bray.com/images/PG/1361/1361070-gf.jpg', 1, 1, 2);
-- endregion Insert data

-- Save the changes
COMMIT WORK;