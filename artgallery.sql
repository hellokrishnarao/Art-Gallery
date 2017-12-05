-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2017 at 02:43 PM
-- Server version: 5.7.20-ndb-7.5.8
-- PHP Version: 7.0.26-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artgallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_fname` varchar(30) DEFAULT NULL,
  `artist_lname` varchar(30) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_fname`, `artist_lname`, `style_id`) VALUES
(1, 'Rembrandt', 'Rijn', 1),
(2, 'Michelangelo', 'Caravaggio', 1),
(3, 'Paul', 'Klee', 2),
(4, 'Pablo', 'Picasso', 2),
(5, 'Henri', 'Matisse', 3),
(6, 'Andre', 'Derain', 3),
(7, 'Edgar', 'Degas', 4),
(8, 'Leonardo', 'daVinci', 4),
(9, 'Giotto', 'Bondone', 5),
(10, 'Raphael', 'Urbino', 5);

-- --------------------------------------------------------

--
-- Table structure for table `curator`
--

CREATE TABLE `curator` (
  `curator_id` int(11) NOT NULL,
  `curator_fname` varchar(30) DEFAULT NULL,
  `curator_lname` varchar(30) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curator`
--

INSERT INTO `curator` (`curator_id`, `curator_fname`, `curator_lname`, `style_id`, `rating`) VALUES
(1, 'Bob', 'White', 1, 5),
(2, 'Sam', 'Brown', 2, 4),
(3, 'Rob', 'Snow', 3, 4),
(4, 'Pete', 'Parker', 4, 3),
(5, 'Jack', 'Jones', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `painting`
--

CREATE TABLE `painting` (
  `painting_id` int(11) NOT NULL,
  `painting_name` varchar(40) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL,
  `wing_name` varchar(10) DEFAULT NULL,
  `info` text NOT NULL,
  `img_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `painting`
--

INSERT INTO `painting` (`painting_id`, `painting_name`, `artist_id`, `style_id`, `wing_name`, `info`, `img_name`) VALUES
(1, 'The Return of the Prodigal Son', 1, 1, 'A', 'The Return of the Prodigal Son is an oil painting by Rembrandt. It is among the Dutch master\'s final works, likely completed within two years of his death in 1669.\r\nRembrandt made a variety of drawings, etchings, and paintings on the theme that spanned decades, beginning with a 1636 etching.', 'return_of_the_prodigal_son_rembrandt.jpg'),
(2, 'The Night Watch', 1, 1, 'A', 'The Night Watch is a 1642 painting by Rembrandt van Rijn. The painting is famous for three things: its colossal size (11.91 ft x 14.34 ft)), the dramatic use of light and shadow and the perception of motion in what would have traditionally been a static military group portrait. The painting was completed in 1642, at the peak of the Dutch Golden Age.', 'the_night_watch_rembrandt.jpg'),
(3, 'The Calling of Saint Matthew', 2, 1, 'A', 'The Calling of Saint Matthew is a masterpiece by Michelangelo Merisi da Caravaggio, depicting the moment at which Jesus Christ inspires Matthew to follow him. It was completed in 1599 for the Contarelli Chapel in the church of the French congregation, San Luigi dei Francesi in Rome.', 'the_calling_of_saint_matthew_caravaggio.jpg'),
(4, 'The Supper at Emmaus', 2, 1, 'A', 'The Supper at Emmaus is a painting by the Italian Baroque master Caravaggio, executed in 1601. Originally this painting was commissioned and paid for by Ciriaco Mattei, brother of cardinal Girolamo Mattei.', 'supper_at_emmaus_national_caravaggio.jpg'),
(5, 'Castle and Sun', 3, 2, 'B', 'Castle and Sun is an abstract painting by Swiss artist Paul Klee. The image is created out of several geometric shapes like triangles and rectangles in various shades of color. \r\nThe orange sun shines in a deep red sky, the city skyline is designed in strong lines and colorful triangular and rectangular shapes which add depth to the abstract artwork.', 'castle_and_sun_klee.jpg'),
(6, 'Fish Magic', 3, 2, 'B', 'Fish Magic was completed in 1925. As with many of Paul Klee\'s paintings, it is a mixture of expressionism, romanticism, and surrealism combining aquatics with celestial and earthly characteristics. \nA line from the clock tower to this area creates a collage of sorts, looking as if a curtain is about to be pulled back to display more magical events.\n', 'fish_magic_klee.jpg'),
(7, 'The Old Guitarist', 4, 2, 'B', 'The Old Guitarist is an oil painting by Pablo Picasso created between late 1903 -\r\n early 1904. It depicts an old, blind, haggard man with threadbare clothing weakly hunched over his guitar, playing in the streets of Barcelona, Spain.', 'old_guitarist_picasso.jpg'),
(8, 'Portrait of Angel Fernandez de Soto', 4, 2, 'B', 'Portrait of Angel Fernandez de Soto is a portrait by Spanish artist Pablo Picasso completed in 1903 during his Blue Period. The oil painting depicts Picasso\'s friend and fellow painter, Angel Fernandez De Soto, in a bar with a glass of absinthe. \r\nThe painting was previously owned by musical theatre composer Andrew Lloyd Webber.', 'portrait_of_angel_picasso.jpg'),
(9, 'The Green Stripe', 5, 3, 'C', 'The Green Stripe also known as Portrait of Madame Matisse, is a portrait by Henri Matisse of his wife, Amelie Noellie Matisse-Parayre. It is an oil painting on canvas, completed in 1905. \r\nIt is named for the green band that divides the face in half, by which Matisse sought to produce a sense of light, shadow, and volume without using traditional shading.\r\n', 'green_stripe_mattisse.jpg'),
(10, 'Woman with a Hat', 5, 3, 'C', 'Woman with a Hat (La femme au chapeau) is a painting by Henri Matisse. An oil on canvas, it depicts Matisse\'s wife, Amelie. It was painted in 1905 and exhibited at the Salon d\'Automne during the fall of the same year.', 'woman_in_a_hat_mattisse.jpg'),
(11, 'Landscape near Chatou', 6, 3, 'C', 'Landscape near Chatou is an Oil painting and was painted in Private Collection, 1904 by Andre Derain, one of the founders of Fauvism. The dimensions of the painting are 46.04 x 56.2 cm.', 'landscape_near_chatou_derain.jpg'),
(12, 'London Bridge', 6, 3, 'C', 'In 1905, French painter Andre Derain was commissioned by his art dealer Ambroise Vollard to paint views of London. The subject of this landscape, London Bridge, was one of several bridges built across the River Thames as part of a larger movement at the turn of the 19th century to modernize the city center with grand new architectural projects and public works.', 'london_bridge_derain.jpg'),
(13, 'A Cotton Office in New Orleans', 7, 4, 'D', 'A Cotton Office in New Orleans is an 1873 oil painting by Edgar Degas. In it, Degas depicts his Uncle Michel Musson\'s cotton brokerage business. In the painting, Musson is seen examining raw cotton for its quality while Degas\'s brother Rene reads The Daily Picayune.', 'cotton_office_in_new_orleans_degas.jpg'),
(14, 'The Dance Foyer', 7, 4, 'D', 'The Foyer of the Opera at Rue Le Peletier shows ten ballerinas being examined in the great hall. The work is organized around the polarity of group and single figure. The scene, remarkable for the rigour of its composition, has a distinctive energy centre in the vacant chair at the fore.', 'dance_foyer_degas.jpg'),
(15, 'The Last Supper', 8, 4, 'D', 'The Last Supper is a late 15th-century mural painting by Leonardo da Vinci housed by the refectory of the Convent of Santa Maria delle Grazie in Milan.  The work was commissioned as part of a plan of renovations to the church and its convent buildings by Leonardo\'s patron Ludovico Sforza, Duke of Milan.\r\n', 'last_supper_davinci.jpg'),
(16, 'Portrait of a Musician', 8, 4, 'D', 'The man in the painting was at one time thought to be Franchino Gaffurio, who was the maestro di cappella of the Milanese Cathedral. The piece of paper he holds is at least one part of a musical score; it has notes written on it. \r\nThe painting was greatly restored and repainted, and Leonardo probably left the portrait unfinished but close to completion.', 'portrait_of_a_musician_davinci.jpg'),
(17, 'The Navicella', 9, 5, 'E', 'The Navicella (literally \"little ship\") of Old Saint Peter\'s Basilica in Rome, was a large and famous mosaic that occupied a large part of the wall above the entrance arcade attributed to Giotto di Bondone around 1305-13. A full-scale copy in oil was commissioned by the Vatican in 1628.', 'navicella_giotto.jpg'),
(18, 'Saint Francis Receiving the Stigmata', 9, 5, 'E', 'Saint Francis Receiving the Stigmata is a panel painting in tempera by the Italian artist Giotto, painted around 1295-1300. It shows an episode from the life of Saint Francis of Assisi, and is 314 cm high by 162 cm wide.\n', 'stigmatization_of_st_francis_giotto.jpg'),
(19, 'The School of Athens', 10, 5, 'E', 'The School of Athens is one of the most famous frescoes by the Italian Renaissance artist Raphael. It was painted between 1509 and 1511 as a part of Raphael\'s commission to decorate the rooms now known as the Stanze di Raffaello, in the Apostolic Palace in the Vatican. ', 'the_school_of_athens_raphael.jpg'),
(20, 'The Transfiguration', 10, 5, 'E', 'The Transfiguration is the last painting by the Italian High Renaissance master Raphael. Commissioned by Pope Clement VII (1523-1534) and conceived as an altarpiece for the Narbonne Cathedral in France, Raphael worked on it until his death in 1520.', 'transfiguration_raphael.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `style_id` int(11) NOT NULL,
  `style_name` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`style_id`, `style_name`, `start_date`, `end_date`) VALUES
(1, 'Baroque', '1590-01-01', '1725-01-01'),
(2, 'Expressionism', '1901-01-01', '1920-01-01'),
(3, 'Fauvism', '1904-01-01', '1910-01-01'),
(4, 'Realism', '1850-01-01', '1912-01-01'),
(5, 'Renaissance', '1300-01-01', '1700-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `wing`
--

CREATE TABLE `wing` (
  `wing_name` varchar(10) NOT NULL,
  `style_id` int(11) DEFAULT NULL,
  `curator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wing`
--

INSERT INTO `wing` (`wing_name`, `style_id`, `curator_id`) VALUES
('A', 1, 1),
('B', 2, 2),
('C', 3, 3),
('D', 4, 4),
('E', 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `style_id` (`style_id`);

--
-- Indexes for table `curator`
--
ALTER TABLE `curator`
  ADD PRIMARY KEY (`curator_id`),
  ADD KEY `style_id` (`style_id`);

--
-- Indexes for table `painting`
--
ALTER TABLE `painting`
  ADD PRIMARY KEY (`painting_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `style_id` (`style_id`),
  ADD KEY `wing_name` (`wing_name`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`style_id`);

--
-- Indexes for table `wing`
--
ALTER TABLE `wing`
  ADD PRIMARY KEY (`wing_name`),
  ADD KEY `style_id` (`style_id`),
  ADD KEY `curator_id` (`curator_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `curator`
--
ALTER TABLE `curator`
  ADD CONSTRAINT `curator_ibfk_1` FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `painting`
--
ALTER TABLE `painting`
  ADD CONSTRAINT `painting_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `painting_ibfk_2` FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `painting_ibfk_3` FOREIGN KEY (`wing_name`) REFERENCES `wing` (`wing_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wing`
--
ALTER TABLE `wing`
  ADD CONSTRAINT `wing_ibfk_1` FOREIGN KEY (`style_id`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wing_ibfk_2` FOREIGN KEY (`curator_id`) REFERENCES `curator` (`curator_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
