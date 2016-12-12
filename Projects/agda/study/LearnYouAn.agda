module LearnYouAn where

  data ℕ : Set where
    zero : ℕ
    suc  : ℕ → ℕ

  _+_ : ℕ → ℕ → ℕ
  zero + m = m
  (suc n) + m = suc (n + m)
