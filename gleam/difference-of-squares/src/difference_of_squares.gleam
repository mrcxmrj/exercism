fn sum_of_first_n_transformed(
  n: Int,
  current_sum: Int,
  transform: fn(Int) -> Int,
) -> Int {
  case n {
    1 -> transform(n) + current_sum
    _ ->
      sum_of_first_n_transformed(n - 1, transform(n) + current_sum, transform)
  }
}

pub fn square_of_sum(n: Int) -> Int {
  let sum = sum_of_first_n_transformed(n, 0, fn(x) { x })
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  sum_of_first_n_transformed(n, 0, fn(x) { x * x })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
