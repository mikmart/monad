# pipe operators throw useful errors for incorrect usage

    Code
      m %>>% f
    Condition
      Error in `m %>>% f`:
      ! `rhs` must be a call, not a symbol.

---

    Code
      m %>-% f
    Condition
      Error in `m %>-% f`:
      ! `rhs` must be a call, not a symbol.

