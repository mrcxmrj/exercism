pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(length_km: Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(Romance) | Restaurant(Korean) -> Yes
    Walk(length_km) if length_km > 11 -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(length_km) if length_km > 6 -> Maybe
    _ -> No
  }
}
