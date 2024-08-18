fn is_evenly_divisible_by(number: Int, divisor: Int) -> Bool {
  case number % divisor {
    0 -> True
    _ -> False
  }
}

pub fn is_leap_year(year: Int) -> Bool {
  let divisible_by_4 = is_evenly_divisible_by(year, 4)
  let divisible_by_100 = is_evenly_divisible_by(year, 100)
  let divisible_by_400 = is_evenly_divisible_by(year, 400)
  divisible_by_4
  && { !divisible_by_100 || divisible_by_100 && divisible_by_400 }
}
