INSERT INTO `dbis`.`makertypes` (`id`, `name`)
VALUES
(1, 'Group'),
(2, 'Artist');

INSERT INTO `dbis`.`makers` (`id`, `name`, `musicbrainzId`, `type`)
VALUES
(1, 'Pharrell Williams', 432, 2),
(2, 'Kings Of Leon', 123, 1),
(3, 'Neon Trees', 498, 1),
(4, 'Marc Forster', 4987, 2);

INSERT INTO `dbis`.`tracks` (`id`, `title`, `musicbrainzId`, `maker`)
VALUES
(1, 'Happy', 482, 1),
(2, 'Use Somebody', 9830, 2),
(3, 'Sex On Fire', 37829, 2),
(4, 'Pyro', 3819, 2),
(5, 'Animal', 3915, 3),
(6, '1983', 2, 3),
(7, 'Auf dem Weg', 98098, 4);

INSERT INTO `dbis`.`users` (`id`, `name`)
VALUES
(1, 'User1'),
(2, 'User2'),
(3, 'User3'),
(4, 'User4'),
(5, 'User5');

INSERT INTO `dbis`.`listeningto` (`user`, `track`)
VALUES
(1, 1),
(1, 6),
(1, 5),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 7),
(4, 4),
(5, 1),
(5, 2),
(5, 3);