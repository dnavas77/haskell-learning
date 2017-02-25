{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

module AlgebraicDatatypes where

import Data.Int


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Algebraic Datatypes
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Introduction to datatypes that Hskell offers

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Data Declarations Review
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Data Constructors and Values
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

data DogueDeBordeaux doge = DogueDeBordeaux doge

data Doggies a = Husky a | Mastiff a deriving (Eq, Show)

-- 2. What is the kind of Doggies?
-- * -> *

-- 3. What is the kind of Doggies String?
-- Doggies String :: *

-- 4. What is the type of Husky 10?
-- Husky 10 :: Num a => Doggies a

-- 5. What is the type of Husky (10 :: Integer)?
-- Husky (10 :: Integer) :: Doggies Integer

-- 6. What is the type of Mastiff "Scooby Doo"?
-- Mastiff "Scooby Doo" :: Doggies [Char]

-- 7. Is DogueDeBordeaux a type constructor or a data constructor?
-- Both

-- 8. What is the type of DogueDeBordeaux?
-- DogueDeBordeaux :: doge -> DogueDeBordeaux doge

-- 9. What is the type of DogueDeBordeaux "doggie!"
-- DogueDeBordeaux "doggie" :: DogueDeBordeaux [Char]


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Exercises: Vehicles
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
data Price = Price Integer deriving (Eq, Show)
data Manufacturer =
      Mini
    | Mazda
    | Tata
    deriving (Eq, Show)

data Airline =
      PapuAir
    | CatapultsR'Us
    | TakeYourChancesUnited
  deriving (Eq, Show)

data Vehicle =
      Car Manufacturer Price
    | Plane Airline
    deriving (Eq, Show)

myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir

-- 1. What is the type of myCar?
-- myCar :: Vehicle

-- 2. Difine the functions
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ ) = True
isPlane _          = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Write a function that tells the manufacturer
getManu :: Vehicle -> Maybe Manufacturer
getManu (Car a _) = Just a
getManu _         = Nothing

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Data Constructor Arities
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Reading...

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- What Makes These Datatypes Algebraic
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Reading...

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Exercises: Cardinality
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. Answer 1
data PugType = PugData

-- 2. Answer 3
data Airline1 =
  PapuAir1
    | CatapultsR'Us1
    | TakeYourChancesUnited1

-- 3. Cardinality of Int16
-- 4. What's the connection between the 8 in Int8 and that types' cardinality of 256?
-- 2 ^ 8

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Simple Datatypes with Nullary Data Constructors
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Unary Constructors
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- newtype
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany (Int, String) where
  tooMany (n, s) = n > 42

instance TooMany (Int, Int) where
  tooMany (n, s) = (n + s) > 42

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (n, n') = tooMany (n + n')

-- ~~~
newtype Goats =
  Goats Int deriving (Eq, Show, TooMany)

-- ~~~
newtype Cows =
  Cows Int deriving (Eq, Show)


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- SUM Types: Exercises
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1.
data BigSmall =
      Big Bool
    | Small Bool
    deriving (Eq, Show)

  -- cardinality 4

-- 2.
data NumberOfBool =
    Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)

  -- cardinality: 256 + 2

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Product Types
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
data QuantumBool = QuantumTrue
                 | QuantumFalse
                 | QuantumBoth deriving (Eq, Show)

data TwoQs = MKTwoQs QuantumBool QuantumBool deriving  (Eq, Show)
-- Product type. Cardinality (cardinality of QuantumBool * cardinality of QuantumBool)
-- 3 * 3 = 9

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Record Syntax
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
data Person =
  Person { name :: String
         , age :: Int }
         deriving (Eq, Show)

papu = Person "Papu" 5
-- > name papu -> "Papu"
-- > age papu  -> 5

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Normal Form
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--data Fiction    = Fiction deriving Show
--data NonFiction = NonFiction deriving Show

{- data BookType = FictionBook Fiction
              | NonFictionBook NonFiction
              deriving Show -}

type AuthorName = String

--data Author = Author (AuthorName, BookType)

-- Apply distributive property and rewrite Author in normal form
data Author = Fiction AuthorName
            | NonFiction AuthorName
            deriving (Eq, Show)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Exercises: How Does Your Garden Grow
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1.
{-data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show -}

type Gardener = String

-- data Garden = Garden Gardener FlowerType deriving Show

  -- Normal form of Garden?
data Garden = Gardenia Gardener
              | Daisy Gardener
              | Rose Gardener
              | Lilac Gardener
              deriving Show

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 11.3: Constructing and Deconstructing Values
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~













