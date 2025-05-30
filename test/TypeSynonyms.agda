open import Haskell.Prim using (Type)

data Nat : Type where
  Zero : Nat
  Suc  : Nat → Nat
{-# COMPILE AGDA2HS Nat #-}

Nat' = Nat
{-# COMPILE AGDA2HS Nat' #-}

myNat : Nat'
myNat = Suc (Suc Zero)
{-# COMPILE AGDA2HS myNat #-}

data List (a : Type) : Type where
  Nil : List a
  Cons : a → List a → List a
{-# COMPILE AGDA2HS List #-}

List' : Type → Type
List' a = List a
{-# COMPILE AGDA2HS List' #-}

NatList = List Nat
{-# COMPILE AGDA2HS NatList #-}

myListFun : List' Nat' → NatList
myListFun Nil = Nil
myListFun (Cons x xs) = Cons x (myListFun xs)
{-# COMPILE AGDA2HS myListFun #-}

ListList : Type → Type
ListList a = List (List a)
{-# COMPILE AGDA2HS ListList #-}

flatten : ∀ {a} → ListList a → List a
flatten Nil = Nil
flatten (Cons Nil xss) = flatten xss
flatten (Cons (Cons x xs) xss) = Cons x (flatten (Cons xs xss))
{-# COMPILE AGDA2HS flatten #-}
