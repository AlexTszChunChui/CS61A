CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name, b.size FROM dogs AS a, sizes AS b WHERE a.height > b.min and a.height <= b.max; ;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.name FROM dogs AS a, parents AS b, dogs AS C WHERE a.name = b.child AND b.parent = c.name ORDER BY c.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name AS first, a.height AS firstheight, b.name AS second, b.height AS secondheight FROM dogs AS a, dogs AS b, parents AS c, 
  parents AS d WHERE a.name = c.child AND b.name = d.child AND c.parent = d.parent AND a.name < b.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || a.first || " plus " || a.second || " have the same size: " || b.size FROM siblings AS a, sizes AS b WHERE 
  a.firstheight > b.min and a.firstheight <= b.max and a.secondheight > b.min and a.secondheight <= b.max and a.first < a.second;

