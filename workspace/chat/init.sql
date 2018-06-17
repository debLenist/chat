DROP SCHEMA IF EXISTS chat CASCADE;
CREATE SCHEMA chat ;
CREATE TABLE chat.utilisateurs (
	id_utilisateur SERIAL PRIMARY KEY,
	nom VARCHAR NOT NULL,
	prenom VARCHAR NOT NULL,
	email VARCHAR NOT NULL, /* vérification email unique en JAVA */
	pseudo VARCHAR NOT NULL,/* vérification pseudo unique en JAVA */
	mdp VARCHAR NOT NULL,
	dateNaissance TIMESTAMP NOT NULL
);
CREATE TABLE chat.chats(
	id_chat SERIAL PRIMARY KEY,
	id_admin Integer NOT NULL,
	CONSTRAINT id_adminFK FOREIGN KEY (id_admin) REFERENCES chat.utilisateurs(id_utilisateur),
	nom VARCHAR NOT NULL /*vérification nom unique en JAVA */
);
CREATE TABLE chat.messages(
	id_message SERIAL PRIMARY KEY,
	id_user Integer NOT NULL,
	id_chat Integer NOT NULL,
	message VARCHAR NOT NULL,
	CONSTRAINT id_utilisateurFK FOREIGN KEY(id_user) REFERENCES chat.utilisateurs(id_utilisateur),
	CONSTRAINT id_chatFK FOREIGN KEY (id_chat) REFERENCES chat.chats(id_chat)
);
CREATE TABLE chat.participations(
	id_user Integer NOT NULL, 
	id_chat Integer NOT NULL,
	CONSTRAINT id_userFK FOREIGN KEY(id_user) REFERENCES chat.utilisateurs(id_utilisateur),
	CONSTRAINT id_chatFK FOREIGN KEY(id_chat) REFERENCES chat.chats(id_chat),
	CONSTRAINT id_participation PRIMARY KEY (id_user,id_chat)
);