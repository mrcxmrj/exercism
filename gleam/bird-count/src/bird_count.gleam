import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..] -> today
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [today, ..rest] -> [today + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

fn total_loop(days: List(Int), acc: Int) {
  case days {
    [] -> acc
    [current_day, ..rest] -> total_loop(rest, acc + current_day)
  }
}

pub fn total(days: List(Int)) -> Int {
  total_loop(days, 0)
}

pub fn busy_days(days: List(Int)) -> Int {
  days
  |> list.filter(fn(day_count) { day_count >= 5 })
  |> list.length()
}
