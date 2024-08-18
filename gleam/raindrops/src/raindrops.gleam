import gleam/int

fn get_sound_if_divisible(number: Int, divisor: Int, sound: String) -> String {
  case number % divisor == 0 {
    True -> sound
    False -> ""
  }
}

fn get_sounds(number: Int) -> String {
  get_sound_if_divisible(number, 3, "Pling")
  <> get_sound_if_divisible(number, 5, "Plang")
  <> get_sound_if_divisible(number, 7, "Plong")
}

pub fn convert(number: Int) -> String {
  case get_sounds(number) {
    "" -> int.to_string(number)
    sounds -> sounds
  }
}
